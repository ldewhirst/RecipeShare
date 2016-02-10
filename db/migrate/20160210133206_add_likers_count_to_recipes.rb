class AddLikersCountToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :likers_count, :integer
  end
end
