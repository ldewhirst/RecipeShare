class SocializationsController < ApplicationController
#   before_filter :load_socializable
#
#   def follow
#     current_user.follow!(@socializable)
#     render json: { follow: true }
#   end
#
#   def unfollow
#     current_user.unfollow!(@socializable)
#     render json: {follow: false }
#   end
#
#   def like
#     @recipe = Recipe.find(params[:recipe_id])
#     current_user.like!(@recipe)
#
#     if like.save
#       flash[:notice] = "Recipe liked!"
#       redirect_to @recipe
#     else
#       flash[:alert] = "Error! Please try agian."
#       redirect_to @recipe
#     end
#   end
#
#   def unlike
#     @recipe = Recipe.find(params[:recipe_id])
#     current_user.unlike!(@recipe)
#
#
#     if like.destroy
#       flash[:notice] = "Recipe unliked!"
#       redirect_to @recipe
#     else
#       flash[:alert] = "Error! Please try again."
#       redirect_to @recipe
#     end
#   end
#
#   private
#
#   def load_socializable
#     @socializable =
#       case
#       when id = params[:comment_id]
#         @community.comments.find(id)
#       when id = params[:recipe_id]
#         @community.recipes.find(id)
#       when id= params[:user_id]
#         User.find(id)
#       else
#         raise ArgumentError, "Unsupported socializable model, params: " +
#                               params.keys.inspect
#       end
#     raise ActiveRecord::RecordNotFound unless @socializable
#   end
#
end
