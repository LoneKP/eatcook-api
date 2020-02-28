# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :meals
  has_many :orders
  has_many :pickups, through: :orders

  validates :name, presence: true
  validates :email, presence: true

  def meals_ordered_by_user_in_the_past
    orders.where('pickup_time < ?', Time.now)
  end

  def meals_ordered_by_user_in_the_future
    orders.where('pickup_time > ?', Time.now)
  end

  def meals_cooked_by_user_in_the_past
    meals.where('pickup_time < ?', Time.now)
  end

  def meals_to_be_cooked_by_user_in_the_future
    meals.where('pickup_time > ?', Time.now)
  end
end
