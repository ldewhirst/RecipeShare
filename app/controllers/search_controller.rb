class SearchController < ApplicationController
  def index
    if params[:search]
      @recipes = Recipe.search(params[:search])
    else
      flash[:alert] = "No recipes found with #{term}"
    end
  end
end
