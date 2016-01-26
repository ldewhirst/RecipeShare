class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new
    @recipe.title = params[:recipe][:title]
    @recipe.body = params[:recipe][:body]

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
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.title = params[:recipe][:title]
    @recipe.body = params[:recipe][:body]

    if @recipe.save
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
end
