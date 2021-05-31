Rails.application.routes.draw do

  # Routes for the Food item resource:

  # CREATE
  get("/insert_food_item", { :controller => "food_items", :action => "create" })
          
  # READ
  get("/food_items", { :controller => "food_items", :action => "index" })
  
  get("/food_items/:path_id", { :controller => "food_items", :action => "show" })
  
  # UPDATE
  
  post("/modify_food_item/:path_id", { :controller => "food_items", :action => "update" })
  
  # DELETE
  get("/delete_food_item/:path_id", { :controller => "food_items", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

get("/", { :controller => "users", :action => "index" })

end
