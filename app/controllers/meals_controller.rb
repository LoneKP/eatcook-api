# frozen_string_literal: true

class MealsController < ApplicationController
  def index
    render json: Meal.all.as_json
  end

  def show
    render json: Meal.find(params[:id]).as_json
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
      requires_packaging: params["packaging"], 
      amount: params["number_of_meals"], 
      description: params["description"], 
      address: params["address"], 
      zip: params["zip"], 
      city: params["city"]
    )
  end
end