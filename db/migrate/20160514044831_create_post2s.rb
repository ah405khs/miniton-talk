class CreatePost2s < ActiveRecord::Migration
  def change
    create_table :post2s do |t|
      t.text :content
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
