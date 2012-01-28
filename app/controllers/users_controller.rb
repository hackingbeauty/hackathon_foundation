class UsersController < ApplicationController  
  before_filter :cors_preflight_check, :only => [:index]
  after_filter :cors_set_access_control_headers, :only => [:index] 

  def index
    puts "inside index action"
    @users = User.all
    puts "@users length #{@users}"
    render :json => @users
  end

  def new
    @user = User.new
    @title = "Sign Up"
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def create
    @user = User.new(params[:user])
    @user.save
  end

end
