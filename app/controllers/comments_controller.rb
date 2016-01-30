class CommentsController < ApplicationController
  before_action :require_sign_in
  before_action :authorize_user, only: [:destroy]

  def create
    @recipe = Recipe.find(params[:recipe_id])
    comment = @recipe.comments.new(comment_params)
    comment.user = current_user

    if comment.save
      flash[:notice] = "Comment saved!"
      redirect_to @recipe
    else
      flash[:alert] = "Error! Comment was not saved."
      redirect_to @recipe
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    comment = @recipe.comments.find(params[:id])

    if comment.destroy
      flash[:notice] = "Comment was deleted."
      redirect_to @recipe
    else
      flash[:alert] = "Error! Comment was not deleted."
      redirect_to @recipe
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :name)
  end

  def authorize_user
    comment = Comment.find(params[:id])
    unless (current_user == comment.user) || current_user.admin?
      flash[:alert] = "Whoops! You don't have permission to delete this comment."
      redirect_to comment.recipe
    end
  end
end
