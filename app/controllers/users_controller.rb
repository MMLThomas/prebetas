class UsersController < ApplicationController

    def index
    end

    def show
        @user = User.find(session[:user_id])
    end

    def new
        if logged_in?(session) 
            redirect_to user_path(current_user(session)) 
        else
            @user = User.new
        end
    end

    def create
        @user = User.create(user_params)
        redirect_to login_path
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    def destroy
    end


    private

    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
    end

end
