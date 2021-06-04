# == Schema Information
#
# Table name: food_items
#
#  id            :integer          not null, primary key
#  alert_status  :boolean          default(FALSE)
#  expiry_date   :date
#  food_category :string
#  item_name     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#
class FoodItem < ApplicationRecord
  validates(:user_id, { :presence => true })
  validates(:expiry_date, { :presence => true })
  validates(:item_name, { :presence => true })

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id", :counter_cache => :food_databases_count })
  
end
