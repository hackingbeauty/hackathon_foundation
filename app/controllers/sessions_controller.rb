class SessionsController < ApplicationController
  before_filter :cors_preflight_check, :only => [:create]
  after_filter :cors_set_access_control_headers, :only => [:create]
  
  def new
    @title = "Sign In"
  end



  def destroy
  end

end
