class FoodItemsController < ApplicationController
  def index
    
    matching_food_items = @current_user.food_items

    @list_of_food_items = matching_food_items.order({ :expiry_date => :asc })

    render({ :template => "food_items/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_food_items = FoodItem.where({ :id => the_id })

    @the_food_item = matching_food_items.at(0)

    render({ :template => "food_items/show.html.erb" })
  end

  def create
    the_food_item = FoodItem.new
    the_food_item.user_id = @current_user.id
    the_food_item.item_name = params.fetch("query_item_name")
    the_food_item.food_category = params.fetch("query_food_category")
    the_food_item.expiry_date = params.fetch("query_expiry_date")

    if the_food_item.valid?
      the_food_item.save
      redirect_to("/food_items", { :notice => "Food item created successfully." })
    else
      redirect_to("/food_items", { :alert => "Food item failed to create successfully. Did you add item name and expiry date?" })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_food_item = FoodItem.where({ :id => the_id }).at(0)

    the_food_item.user_id = @current_user.id
    the_food_item.item_name = params.fetch("query_item_name")
    the_food_item.food_category = params.fetch("query_food_category")
    the_food_item.expiry_date = params.fetch("query_expiry_date")

    if the_food_item.valid?
      the_food_item.save
      redirect_to("/food_items/#{the_food_item.id}", { :notice => "Food item updated successfully."} )
    else
      redirect_to("/food_items/#{the_food_item.id}", { :alert => "Food item failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_food_item = FoodItem.where({ :id => the_id }).at(0)

    the_food_item.destroy

    redirect_to("/food_items", { :notice => "Food item deleted successfully."} )
  end
end
