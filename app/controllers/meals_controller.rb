# frozen_string_literal: true

class MealsController < ApplicationController
  def index
    render json: Meal.all.as_json
  end

  def show
    render json: Meal.find(params[:id]).as_json
  end

  def create
  end
  
end
