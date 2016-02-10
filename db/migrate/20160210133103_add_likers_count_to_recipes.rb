class AddLikersCountToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :likers_count, :integer, default: 0
  end
end
