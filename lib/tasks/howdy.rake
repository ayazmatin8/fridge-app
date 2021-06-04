task({ :hello => :environment }) do
  reminders_required = FoodItem.where({ :alert_status => false  })

  cutoff_day = Date.today + 2

  alert_list = reminders_required.where("expiry_date < ?", cutoff_day)

  alert_list.each do |reminder_item|
    p reminder_item.item_name
    p reminder_item.food_category
    reminder_item.alert_status = true
    reminder_item.save

    @user_profile = User.where({ :id => reminder_item.user_id }).at(0)
    user_email = @user_profile.try(:email)
    
    p @user_profile
    p user_email

    require 'mailgun-ruby'
    # Retrieve your credentials from secure storage
    mg_api_key = ENV.fetch("MAILGUN_KEY")
    mg_sending_domain = ENV.fetch("MAILGUN_DOMAIN")

    # Create an instance of the Mailgun Client and authenticate with your API key
    mg_client = Mailgun::Client.new(mg_api_key)

    # Craft your email as a Hash with these four keys
    email_parameters =  { 
      :from => "notification@thefridgeapp.com",
      :to => user_email ,  # Put your own email address here if you want to see it in action
      :subject => "Your " + reminder_item.item_name + " is expiring soon.",
      :text => "Your " + reminder_item.item_name + " is expiring soon. Time to use it!"
    }

    # Send your email!
    mg_client.send_message(mg_sending_domain, email_parameters)
  end

end