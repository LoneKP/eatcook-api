class OrdersController < ApplicationController

  def create
    @meal = Meal.find(params["mealId"])
    @order_amount = params["orderAmount"]
    # Pickup.transaction do
    @order = Order.create(
      user: @current_user,
      pickup_time: @meal.pickup_time,
      address: @meal.address,
      city: @meal.city,
      zip: @meal.zip,
      amount: @order_amount
    )
    @order_amount.times do
      create_pickup
    end
      update_meal
    # end
  end

  def meals_you_ate
    render json: @current_user.meals_you_ate.as_json 
  end

  def meals_you_will_eat
    render json: @current_user.meals_you_will_eat.as_json
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
    )
    pickup.update(attributes)
  end

  def update_meal
    @meal.amount = @meal.amount - @order_amount
    @meal.save
  end
end
