class Meal < ApplicationRecord
  has_one_attached :meal_image
  belongs_to :user
  has_many :pickups
  has_many :orders

  scope :not_sold_out, -> { where("amount > 0") }

  scope :has_booking, -> { joins(:pickups) }

  scope :pickup_time_not_reached, -> { where("pickup_time > ?", Time.now)}
end
