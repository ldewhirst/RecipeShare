class TagsController < ApplicationController

  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @recipes = Recipe.tagged_with(@tag.name)
  end

end
