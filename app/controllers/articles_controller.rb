class ArticlesController < ApplicationController
    # on start, find relevant article in the article table for methods show,edit,update and destroy using find_article method
    before_action :find_article, only: [:show, :edit, :update, :destroy]
    def show 
    end

    def index
        @articles = Article.all
    end

    def new
    # initiate new article instance variable, later used to create new article
        @article = Article.new
    end

    def edit
    end

    def create
        #creating new article with required title and description
        @article = Article.new(article_parameters)
        if @article.save
            # display message when article is saved
            flash[:notice] = "Congratulations, your article was saved!"
            # if no errors, after saving redirect to the newly created article
            redirect_to @article
        else
            render 'new'
        end
    end

    def update
        if @article.update(article_parameters)
            flash[:notice] = "Success, article was updated!"
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private

    def find_article
        @article = Article.find(params[:id])
    end

    def article_parameters
        params.require(:article).permit(:title, :description, :image)
    end
end