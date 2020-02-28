# frozen_string_literal: true

class OrdersController < ApplicationController
  def create
    @meal = Meal.find(params['mealId'])
    @order_amount = params['orderAmount']
    # Pickup.transaction do
    @order = Order.create(
      user: @current_user,
      meal_id: @meal.id,
      pickup_time: @meal.pickup_time,
      address: @meal.address,
      city: @meal.city,
      zip: @meal.zip,
      amount: @order_amount,
      name: @meal.name
    )
    @order_amount.times do
      create_pickup
    end
    update_meal
    # end
  end

  def meals_ordered_by_user_in_the_past
    render json: @current_user.meals_ordered_by_user_in_the_past.as_json
  end

  def meals_ordered_by_user_in_the_future
    render json: @current_user.meals_ordered_by_user_in_the_future.includes(:pickups).as_json
  end

  def future_order_pickups
    order = Order.find(params[:id])

    render json: order.as_json(
      include: {
        meal: {
          methods: :meal_image_url,
          only: %i[name pickup_time address zip city description cook_provides_packaging],
          include: {
            user: {
              only: [:name]
            }
          }
        }
      }
    )
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
      order: @order
    )
    pickup.update(attributes)
  end

  def update_meal
    @meal.amount = @meal.amount - @order_amount
    @meal.save
  end
end
