class ProjectsController < ApplicationController

    def index
        params[:search] ? @projects = Project.search(params) : @projects = Project.all
    end

    def show
        @project = Project.find(params[:id])
        @comment = Comment.new
    end

    def new
        @project = Project.new
    end

    def create
        current_user(session).projects.create(project_params)
        redirect_to projects_path
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id])
        @project.update(project_params)
    end

    def destroy

    end

    private
    def project_params
        params.require(:project).permit(:title, :short_description, :story, :image, :start_date, :duration, :incentive, :goal)
    end
    
end
