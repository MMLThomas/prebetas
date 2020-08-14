class ProjectsController < ApplicationController
    before_action :set_project!, only: [:show, :edit, :update]
    before_action :require_login, only: [:new, :edit]

    def index
        params[:search] ? @projects = Project.search(params) : @projects = Project.all
    end

    def show
    end

    def new
        @project = Project.new
    end

    def create
        @project = current_user(session).projects.new(project_params)
        if @project.valid?
        @project.save
        redirect_to project_path(@project)
        else
        render :new
        end
    end

    def edit
        if @project.user != current_user(session)
            redirect_to user_path(current_user(session))
        end
    end

    def update
        @project.update(project_params)
        if @project.valid?
          redirect_to project_path(@project)
        else
          render :edit
        end
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy
        flash[:notice] = "Project deleted."
        redirect_to projects_path
    end

    private

    def project_params
        params.require(:project).permit(:title, :short_description, :story, :image, :start_date, :duration, :incentive, :goal)
    end

    def set_project!
        @project = Project.find(params[:id])
    end

    def require_login
    redirect_to '/login' unless session.include? :user_id
    end
    
end
