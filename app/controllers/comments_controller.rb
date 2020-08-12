class CommentsController < ApplicationController

    def create
        @comment = Comment.create(comment_params)
    end

    def destroy
        Comment.destroy(params[:id])
    end



    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :project_id)
    end
end
