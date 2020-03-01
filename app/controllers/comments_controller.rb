class CommentsController < ApplicationController
    def new
        @article = Article.find_by_slug(params[:slug])
        @article.comments.create(params[:comment].permit(:comment))
        
        if @comment.save
            redirect_to root_path
        end
    end

    def destroy
        @article = Article.find_by_id(params[:slug])
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to @article
        
    end
end
