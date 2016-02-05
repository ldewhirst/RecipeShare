class RecipesController < ApplicationController
  before_action :require_sign_in, except: [:index, :show]

  def index
    Recipe.all.order_by_recently_created
    if params[:tag].present?
      @recipes = Recipe.tagged_with(params[:tag])
    else
      @recipes = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @users = User.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id

    if @recipe.save
      flash[:notice] = "Recipe saved!"
      redirect_to @recipe
    else
      flash.now[:alert] = "Error! Recipe not saved."
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @users = User.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.assign_attributes(recipe_params)

    if @recipe.update_attributes(recipe_params)
      flash[:notice] = "Recipe updated!"
      redirect_to @recipe
    else
      flash.now[:alert] = "Error! Recipe not updated."
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    if @recipe.destroy
      flash[:notice] = "\"#{@recipe.title}\" has been deleted."
      redirect_to recipes_path
    else
      flash.now[:alert] = "Error! The recipe has not been deleted."
      render :show
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :body, :bootsy_image_gallery_id, :tag_list, :image, :source, :ingredients)
  end

end
