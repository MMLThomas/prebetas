class SessionsController < ApplicationController


    #if user is not logged in sends them to login page, if they are redirects to their account 
    def new
        if logged_in?(session) 
            redirect_to user_path(current_user(session)) 
        end

    end

    #verifies user information, creates a new session and sends them to their account or presents login error
    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to '/login'
        end 
    end

    def omniauth
        @user = User.from_omniauth(request.env['omniauth.auth'])
        session[:user_id] = @user.id
        redirect_to root_path
    
    end

    #logs user out and redirects them to the site homepage 
    def destroy
        if session[:user_id]
            session.delete :user_id
            redirect_to root_path
        end
    end


    private

    def auth
        request.env['omniauth.auth']
    end



end