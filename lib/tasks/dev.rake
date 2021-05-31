desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do

  #if Rails.env.development?
   # User.destroy_all
   # FoodItem.destroy_all
  #end


  a = User.new
  a.email = "alice@example.com"
  a.password = "password"
  a.phone_number = "+1112223333"
  a.id = 2
  a.save

  b = User.new
  b.email = "matt@example.com"
  b.password = "password"
  b.phone_number = "+1666623333"
  b.id = 3
  b.save

  p a.errors.full_messages

  p "There are #{User.count} users in the table"

  10.times do
    f = FoodItem.new
    f.item_name = "Food #{rand(10000)}"
    f.food_category = "Category #{rand(200)}"
    f.user = [a, b].sample
    f.expiry_date = Date.today + rand(30).days
    f.save
    p f.errors.full_messages
  end

end
