class CreateFoodItems < ActiveRecord::Migration[6.0]
  def change
    create_table :food_items do |t|
      t.integer :user_id
      t.string :item_name
      t.string :food_category
      t.date :expiry_date

      t.timestamps
    end
  end
end
