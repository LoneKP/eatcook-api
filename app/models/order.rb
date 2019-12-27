class Order < ApplicationRecord
  belongs_to :user
  has_many :pickups
  belongs_to :meal
end
