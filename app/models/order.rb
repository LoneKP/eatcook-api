class Order < ApplicationRecord
  belongs_to :user
  has_many :pickups
  has_many :meals, through: :pickups
end
