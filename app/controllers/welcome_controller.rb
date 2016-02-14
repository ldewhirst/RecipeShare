class WelcomeController < ApplicationController
  def index
    @recipe = Recipe.all.sample
    @most_liked = Recipe.order(likers_count: :desc).first
  end

  def about
  end
end
