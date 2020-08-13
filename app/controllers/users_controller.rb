class UsersController < ApplicationController
    before_action :set_user!, only: [:show, :edit, :update]

    def index
    end

    def show
    end

    def new
        if logged_in?(session) 
            redirect_to user_path(current_user(session)) 
        else
            @user = User.new
        end
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
        @user.save
        redirect_to user_path(@user)
        else
        render :new
        end
    end

    def edit
        if @user != current_user(session)
            redirect_to edit_user_path(current_user(session))
        end
    end

    def update
        @user.update(user_params)
        if @user.valid?
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    def destroy
    end


    private

    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
    end

    def set_user!
        @user = User.find(params[:id])
      end

end
