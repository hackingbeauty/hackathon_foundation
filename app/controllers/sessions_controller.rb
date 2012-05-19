class SessionsController < ApplicationController
    def new
      @title = "Sign In"
    end

    def create
        render 'new'
    end

end
