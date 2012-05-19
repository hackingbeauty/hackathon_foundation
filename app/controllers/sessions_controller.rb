class SessionsController < ApplicationController
    def new
      @title = "Sign In"
    end

    def create
        user = User.authenticate(params[:session][:email],
                                 params[:session][:password])
        if user.nil?
            flash[:error] = "Invalid email/password combination"
            render 'new'
        else
            # handle success
        end
    end

end
