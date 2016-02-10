class SocializationsController < ApplicationController
  before_filter :load_socializable

  def follow
    current_user.follow!(@socializable)
    render json: { follow: true }
  end

  def unfollow
    current_user.unfollow!(@socializable)
    render json: {follow: false }
  end

  private

  def load_socializable
    @socializable =
      case
      when id = params[:comment_id]
        @community.comments.find(id)
      when id = params[:recipe_id]
        @community.recipes.find(id)
      when id= params[:user_id]
        User.find(id)
      else
        raise ArgumentError, "Unsupported socializable model, params: " +
                              params.keys.inspect
      end
    raise ActiveRecord::RecordNotFound unless @socializable
  end
