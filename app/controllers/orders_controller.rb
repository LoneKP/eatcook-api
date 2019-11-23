class OrdersController < ApplicationController

  def create
    @order = Order.create(user: @current_user)
    @meal = Meal.find(params["mealId"])
    @order_amount = params["orderAmount"]
    create_pickup
    update_meal
  end

  private

  def create_pickup
    attributes = @meal.attributes.with_indifferent_access.slice(
      :name, 
      :pickup_time, 
      :cook_provides_packaging,
      :description,
      :address,
      :zip,
      :city
    )
    pickup = Pickup.create(
      meal: @meal, 
      order: @order,
      order_amount: @order_amount
    ) 
    pickup.update(attributes)
  end

  def update_meal
    @meal.amount = @meal.amount - @order_amount
    @meal.save 
  end

end