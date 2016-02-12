class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user_recipes = current_user.recipes
    @liked_recipes = current_user.liked_recipes
  end

end
