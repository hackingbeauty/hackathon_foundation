class SessionsController < ApplicationController
  before_filter :cors_preflight_check, :only => [:create]
  after_filter :cors_set_access_control_headers, :only => [:create]
  
  def new
    @title = "Sign In"
  end

  def create
    puts "============================"
    puts "params[:user] #{params[:user]}"
    latitude = params[:user][:coordinates]['0']['latitude']
    longitude = params[:user][:coordinates]['1']['longitude']

    geolocation_obj = Geolocation.new
    puts "====== about to print ======"
    possible_locations = geolocation_obj.getPossibleLocations(latitude,longitude,10)
    puts possible_locations.count
    
    possible_locations.each do |loc|
      puts loc.address1
      puts loc.city
      puts loc.state
    end

    user = User.find_or_create_by_phone(params[:user])
    coordinate = Coordinate.find_or_create_by_latitude_and_longitude(latitude,longitude);
    user.visits.create!(:coordinate_id => coordinate.id)
    @users = User.all
    if user
      sign_in user
    end
    respond_to do |format|   
      format.json { render :json => { :users => @users } }   
    end
  end

  def destroy
  end

end
