class PagesController < ApplicationController
    def home
    end

    def manager
        @articles = Article.all
    end
end