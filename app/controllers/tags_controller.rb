class TagsController < ApplicationController

  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @recipes = Recipe.tagged_with(params[:id])
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @recipes = Recipe.tagged_with(@tag.name)
  end

end
