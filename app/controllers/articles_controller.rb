class ArticlesController < ApplicationController

    def show 
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
    # initiate new article instance variable, later used to create new article
        @article = Article.new
    end

    def edit
        # find article from Article table with the id passed in the parameters
        @article = Article.find(params[:id])
    end

    def create
        #creating new article with required title and description
        @article = Article.new(params.require(:article).permit(:title, :description))
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
        # find the article being updated in the Article table and assigne to article variable
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "Success, article was updated!"
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        # find the article being deleted in the Article table and assigne to article variable
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

end