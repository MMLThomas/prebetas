class EnrollmentsController < ApplicationController


    def index
        @enrollments = User.find(params[:user_id]).enrollments
    end

    def create
        @enrollment = Enrollment.create(user_id: current_user(session).id, project_id: params[:project_id])
        redirect_to user_path(current_user(session))
    end

    def destroy
    end

end