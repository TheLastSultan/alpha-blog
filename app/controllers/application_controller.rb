class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    # helper method allows you to access these methods in views
    helper_method :current_user, :logged_in?

    def current_user
        # Find user session if the session has a user id
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
        # memoization, only looks for current user once
    end

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:danger] = "You must be logged in to perform that action"
            redirect_to root_path
        end
    end

end
