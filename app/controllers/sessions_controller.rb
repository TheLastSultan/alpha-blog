class SessionsController < ApplicationController

    def new
        
    end

    def create
        # This is the log-in action
        # use debugger to see that params[session][email] yields the email address
        user = User.find_by(email: params[:session][:email].downcase)

        if user && user.authenticate(params[:session][:password])
            #here you are saving user_id in settings hash, whih is backed by browser's cookies
            session[:user_id] = user.id
            username= User.find(user.id).username
            flash[:success] = "Welcome, #{username}!"
            redirect_to articles_path
        else
            # flash.now becasue it works with "render", which is not a redirect
            # flash[default] works with redirect only
            flash.now[:danger] = "Use Username: admin , Password: 'greathire' "
            render 'new'
        end
    end

    def destroy
        # this is the logout action
        session[:user_id] = nil
        flash[:success] = "You have logged out"
        redirect_to articles_path
    end

end