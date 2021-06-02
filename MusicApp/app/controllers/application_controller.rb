class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def login!(@user) # do we need to call reset session_token here?
        session[:session_token] = @user.session_token
    end 

    def current_user  #return current user
        @current_user ||= User.find_by(session_token: session[:session_token])

    end 

    def logged_in?
        !!current_user
    end 

    def logout!  #session's session_token is never saved to the database
        current_user.reset_session_token if logged_in?
        session[:session_token] = nil
        @current_user = nil
    end

    def require_logged_in
        redirect_to new_session_url unless logged_in?
    end 

    def require_logged_out
        redirect_to users_url if logged_in?
    end 
end
