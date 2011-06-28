class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.text :text
      t.integer :ups
      t.integer :down
      t.timestamps
    end
  end
end
