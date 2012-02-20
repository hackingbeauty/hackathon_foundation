class SessionsController < ApplicationController
  before_filter :cors_preflight_check, :only => [:create]
  after_filter :cors_set_access_control_headers, :only => [:create]
  
  def new
    @title = "Sign In"
  end

  def create
    puts "============================"
    puts "params[:user] #{params[:user]}"
    latitude = params[:user][:coordinates]['latitude'].to_f
    longitude = params[:user][:coordinates]['longitude'].to_f

    user = User.find_or_create_by_email(params[:user])
    puts "--------"
    puts "the user is #{user}"
    coordinate = Coordinate.find_or_create_by_latitude_and_longitude(latitude,longitude);
    
    puts "testing geocoder here"
    puts "bearing to paris is #{coordinate.bearing_to("Paris, France")}"
    
    user.visits.create!(:coordinate_id => coordinate.id)

    @users = User.all
    puts "about to render #{@users}"

    if user
      sign_in user
    end
    
    # respond_to do |format|   
    #   format.json { render :json => { :users => @users } }  
    # end    
   render :json => @users
   
  end

  def destroy
  end

end
