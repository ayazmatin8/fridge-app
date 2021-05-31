# == Schema Information
#
# Table name: food_items
#
#  id            :integer          not null, primary key
#  expiry_date   :date
#  food_category :string
#  item_name     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#
class FoodItem < ApplicationRecord

  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id", :counter_cache => :food_databases_count })
  
end
