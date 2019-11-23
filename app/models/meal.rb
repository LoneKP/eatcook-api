class Meal < ApplicationRecord
  belongs_to :user
  has_many :pickups
  has_many :orders, through: :pickups

  def not_sold_out
    self.amount > 0
  end

  scope :not_sold_out, -> { where("amount > 0") }

  
end


