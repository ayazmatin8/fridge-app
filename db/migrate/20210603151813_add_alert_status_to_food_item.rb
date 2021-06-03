class AddAlertStatusToFoodItem < ActiveRecord::Migration[6.0]
  def change
    add_column :food_items, :alert_status, :boolean, :default => false
  end
end
