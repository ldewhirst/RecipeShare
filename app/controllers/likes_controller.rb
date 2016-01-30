class LikesController < ApplicationController
  before_action :require_sign_in

  def create
    recipe = Recipe.find(params[:recipe_id])
    like = current_user.likes.build(recipe: recipe)

    if like.save
      flash[:notice] = "Recipe liked!"
      redirect_to @recipe
    else
      flash[:alert] = "Error! Please try agian."
      redirect_to @recipe
    end
  end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    like = @recipe.likes.find(params[:id])

    if favorite.destroy
      flash[:notice] = "Recipe unliked!"
      redirect_to @recipe
    else
      flash[:alert] = "Error! Please try again."
      redirect_to @recipe
    end
  end

end
