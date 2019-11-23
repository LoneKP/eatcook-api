# frozen_string_literal: true
class User < ApplicationRecord
  has_secure_password
  has_many :meals
  has_many :orders
end
