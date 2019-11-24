class Meal < ApplicationRecord
  belongs_to :user
  has_many :pickups
  has_many :orders, through: :pickups

  scope :not_sold_out, -> { where("amount > 0") }

  scope :has_booking, -> { joins(:pickups) }

end


