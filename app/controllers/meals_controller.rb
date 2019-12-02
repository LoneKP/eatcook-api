# frozen_string_literal: true

class MealsController < ApplicationController
  def index
    render json: Meal.not_sold_out.pickup_time_not_reached.as_json
  end

  def show
    render json: Meal.find(params[:id]).as_json
  end
  
  def future_meals_handouts
    render json: @current_user.future_meal_handouts.uniq.as_json
  end

  def future_meal_handouts
    meal = Meal.find(params[:id])

    render json: meal.pickups.includes(order: [:user]).as_json(
      include: {
        order: {
          include: {
            user: {
              only: [:id, :name]
            }
          }
        }
      }
    )
  end

  def past_meals_handouts
    render json: @current_user.past_meal_handouts.as_json
  end

  def create
    meal = Meal.new
    date = params["date"].to_date.to_datetime
    hour = params["time"].to_time.hour
    minute = params["time"].to_time.min
    pickup_time = date.change({ hour: hour, min: minute })
    meal.update(
      name: params["name"], 
      user_id: @current_user.id,
      pickup_time: pickup_time,
      cook_provides_packaging: params["packaging"], 
      amount: params["number_of_meals"], 
      description: params["description"], 
      address: params["address"], 
      zip: params["zip"], 
      city: params["city"],
      tags: params["tags"]
    )
  end
end