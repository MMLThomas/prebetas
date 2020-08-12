module ApplicationHelper

    #checks if user is logged in
    def logged_in?(session)
        !!session[:user_id]
    end
        
    #retrives current logged in user
    def current_user(session)
        User.find(session[:user_id])
    end

    #validates user is logged and if no redirects
    def not_logged_in_redirect(session)
        if !logged_in?(session)
            redirect '/'
        end
    end
end
