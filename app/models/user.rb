# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  email                :string
#  food_databases_count :integer
#  name                 :string
#  password_digest      :string
#  phone_number         :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  
  has_secure_password

  validates(:phone_number, { :presence => true })
  validates(:phone_number, { :uniqueness => true })

  has_many(:food_items, { :class_name => "FoodItem", :foreign_key => "user_id", :dependent => :destroy })
end
