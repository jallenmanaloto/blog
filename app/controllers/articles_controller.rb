class ArticlesController < ApplicationController

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
        @comment = @article.comments
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)

        respond_to do |format|
            if @article.save
              format.html { redirect_to @article, notice: "Category was successfully created." }
              format.json { render :show, status: :created, location: @article }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @article.errors, status: :unprocessable_entity }
            end
          end
    end

    def edit
    end

    def update
    end

    def delete
    end

    private

    def article_params
        params.require(:article).permit(:name, :body)
    end
end
