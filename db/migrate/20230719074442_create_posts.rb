class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :customer_id
      t.string :name
      t.text :sentence
      t.integer :genre
      t.timestamps
    end
  end
end
