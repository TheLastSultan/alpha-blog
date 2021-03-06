class UsersController < ApplicationController
    before_action :require_same_user, only: [:edit, :update]

    def new
        @user = User.new
    end

    def index
        @users = User.paginate(page: params[:page], per_page: 5)
        
    end

    def create
        @user = User.new(user_params)
        if params["user"]["password"] == params["user"]["password_confirm"]
            if @user.valid?
                @user.save 
                session[:user_id] = @user.id
                redirect_to articles_path
                flash[:success] = "Welcome, #{@user.username}"
            else
                render 'new'
            end
        else
            flash[:danger] = "Please enter matching password"
            render 'new'
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def show
        @user = User.find(params[:id])
        @user_articles = @user.articles.paginate(page: params[:page], per_page: 1)
    end

    def update
        @user = User.find(params[:id])
        if params["user"]["password"] == params["user"]["password_confirm"]
            if @user.valid?
                @user.save 
                redirect_to articles_path
                flash[:success] = "You have successfully update your account, #{@user.username}!"
            else
                flash[:danger] = "User not successfully updated!"
                render 'edit'
            end
        else
            flash[:danger] = "Please enter matching password"
            render 'edit'
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    
    def require_same_user
        if current_user != @user
            flash[:danger] = "You can only edit your own account"
            redirect_to root_path
        end
    end

end