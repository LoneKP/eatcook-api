# frozen_string_literal: true

class MealsController < ApplicationController
  def index
    render json: Meal.all.as_json
  end
end
