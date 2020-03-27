# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    factory :order_with_past_pickup_date do
      pickup_time { 20.days.ago }
    end

    factory :order_with_future_pickup_date do
      pickup_time { 20.days.from_now }
    end
    meal
  end
end
