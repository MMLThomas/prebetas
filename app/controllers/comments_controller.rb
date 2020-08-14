class CommentsController < ApplicationController

    def index
        @project = Project.find(params[:project_id])
        @comments = @project.comments
        render "projects/show"
    end
   
    def new
        @project = Project.find(params[:project_id])
        @comment = Comment.new
        render "projects/show"
    end

    def create
        @project = Project.find(params[:project_id])
        @project.comments.create(content: params[:comment][:content], user_id: current_user(session).id)
        redirect_to project_comments_path(@project)
    end

    def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment deleted."
    redirect_to comments_path
    end




end
