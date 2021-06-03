task({ :hello => :environment }) do
  reminders_required = FoodItem.where({ :alert_status => false  })

  cutoff_day = Date.today + 2

  alert_list = reminders_required.where({ :expiry_date => cutoff_day })

  alert_list.each do |reminder_item|
    p reminder_item.item_name
    p reminder_item.food_category
    reminder_item.alert_status = true
    reminder_item.save
  end

end