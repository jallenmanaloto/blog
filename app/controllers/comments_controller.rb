class CommentsController < ApplicationController
    before_action :get_article

    def index
        @comments = @article.comments
    end

    def new
        @comment = @article.comments.build
    end

    def create
        @comment = @article.comments.build(comment_params)
        if @comment.save
            redirect_to_article_comments_path
        else
            render :new
        end
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    private

    def get_article
        @article = Article.find(params[:article_id])
    end

    def comment_params
        params.require(:comment).permit(:body, :article_id)
    end
end
