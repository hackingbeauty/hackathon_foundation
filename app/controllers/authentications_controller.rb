class AuthenticationsController < ApplicationController
  def index
  end

  def create
    omniauth = request.env["omniauth.auth"] 
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'],omniauth['uid'])
    user_name = omniauth['info']['name']
    the_user = nil
    session[:avatar] = omniauth['info']['image']
    if authentication
      sign_in authentication.user
      redirect_to authentication.user
      the_user = authentication.user
    elsif current_user
      current_user.authentications.create(:provider => omniauth['provider'], :uid => omniauth['uid'])  
      flash[:notice] = "Authentication successful."  
      redirect_to authentications_index_path
      the_user = current_user
    else
      user = User.new  
      user.authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])  
      user.name = user_name
      user.save!  
      sign_in user
      redirect_to user
      the_user = user
    end
    # get coordinate here from session
    puts "==========="
    puts "cookies[:coordinates] is #{cookies[:coordinates]}" #read coordinates from cookie and set in database
  end

  def destroy
  end

end
