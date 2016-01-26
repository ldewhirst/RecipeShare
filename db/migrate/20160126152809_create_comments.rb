class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :recipe, index: true, foreign_key: true
      t.boolean :private

      t.timestamps null: false
    end
  end
end
