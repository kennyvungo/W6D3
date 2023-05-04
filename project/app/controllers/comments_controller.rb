class CommentsController < ApplicationController

    def index
        debugger
        if params[:user_id]
            @comments = Comment.where(author_id: params[:user_id])
        elsif params[:artwork_id]
            @comments = Comment.where(artwork_id: params[:artwork_id])
        else
            @comments = Comment.errors.full_messages
        end
        render json: @comments
    end

    def create
        @comment = Comment.create(comment_params)
        if @comment
            render json: @comment
        else
            render json: Comment.errors.full_messages
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        if @comment
            @comment.destroy
            redirect_to comments_url
        else
            render json: Comment.errors.full_messages
        end
    end

    def comment_params
        params.require(:comment).permit(:body, :author_id, :artwork_id)
    end
end
