class LikesController < ApplicationController
  before_action :require_sign_in

  def create
    @recipe = Recipe.find(params[:recipe_id])
    like = current_user.likes.build(recipe: @recipe)

    if like.save
      flash[:notice] = "Recipe liked!"
      redirect_to @recipe
    else
      flash[:alert] = "Error! Please try again!"
      redirect_to @recipe
    end
  end

  def destroy
    like = Like.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])

    if like.destroy
      flash[:notice] = "Recipe unliked"
      redirect_to @recipe
    else
      flash[:alert] = "Error! Please try again"
      redirect_to @recipe
    end
  end
end
