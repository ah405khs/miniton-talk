class CreateComment2s < ActiveRecord::Migration
  def change
    create_table :comment2s do |t|
      t.text :content
      t.integer :user_id
      t.integer :post2_id

      t.timestamps null: false
    end
  end
end
