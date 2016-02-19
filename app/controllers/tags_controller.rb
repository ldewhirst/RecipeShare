class TagsController < ApplicationController

  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @recipes = Recipe.tagged_with(params[:id])
  end

end
