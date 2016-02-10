class WelcomeController < ApplicationController
  def index
    @recipe = Recipe.all.sample
    @most_liked = Recipe.where
  end

  def about
  end
end
