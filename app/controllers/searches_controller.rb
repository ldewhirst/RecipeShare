class SearchesController < ApplicationController

  def show
    @search = Recipe.search(params[:search])
    @results = @search.result
  end

end