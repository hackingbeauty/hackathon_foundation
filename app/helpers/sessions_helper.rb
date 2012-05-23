module SessionsHelper

    def sign_in(user)
        # cookies.permanent means the cookie experies value is set for 20 years.
        # cookies.signed means the cookie value is hashed
       cookies.permanent.signed[:remember_token] = [user.id, user.salt]
       current_user = user 
    end
    
    # creating a setter method here - this is what attr_accessor does
    def current_user=(user)
       @current_user = user 
    end
    
    # getter
    def current_user
       @current_user ||= user_from_remember_token # basically, if @current_user isn't set, find it in cookie
    end
    
    def signed_in?
       !current_user.nil? 
    end
    
    def sign_out
        cookies.delete(:remember_token) # not worth the trouble testing cookies in spec, changes too frequently when upgrading
        current_user = nil
    end
    
    private
    
        def user_from_remember_token
           User.authenticate_with_salt(*remember_token) # so the '*' basically unwraps the arguments if they're in an array
        end
        
        def remember_token
           cookies.signed[:remember_token] || [nil,nil] 
        end
    
end
