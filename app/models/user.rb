class User < ApplicationRecord
  has_secure_password
  has_many :meals
  has_many :orders
  has_many :pickups, through: :orders

  def meals_you_ate
    orders.where('pickup_time < ?', Time.now)
  end

  def meals_you_will_eat
    orders.where('pickup_time > ?', Time.now)
  end

  def future_meal_handouts
    meals.where('pickup_time > ?', Time.now)
  end

  def past_meal_handouts
    meals.where('pickup_time < ?', Time.now)
  end
end
