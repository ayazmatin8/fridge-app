class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :phone_number
      t.integer :food_databases_count

      t.timestamps
    end
  end
end
