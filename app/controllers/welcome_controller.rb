class WelcomeController < ApplicationController
  def index
    @recipe = Recipe.all.sample
  end

  def about
  end
end
