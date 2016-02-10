class DropLikesTable < ActiveRecord::Migration
  def up
    drop_table :likes
  end
  def down
    create_table :likes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :recipe, index: true, foreign_key: true

      t.timestamps null: false
    end
  end

end
