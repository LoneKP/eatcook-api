# frozen_string_literal: true
class User < ApplicationRecord
  has_secure_password
  has_many :meals
  has_many :orders

  def meals_you_ate
    self.orders.map(&:pickups).flatten.select { |pickup| pickup.pickup_time < Time.now }
  end

  def meals_you_will_eat
    self.orders.map(&:pickups).flatten.select { |pickup| pickup.pickup_time > Time.now }
  end

  def future_meal_handouts
    self.meals.select { |meal| meal.pickup_time > Time.now }
  end

  def past_meal_handouts
    self.meals.select { |meal| meal.pickup_time < Time.now }
  end
end
