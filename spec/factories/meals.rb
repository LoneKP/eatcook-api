# frozen_string_literal: true

FactoryBot.define do
  factory :meal do
    factory :meal_with_past_pickup_date do
      pickup_time { 20.days.ago }
    end

    factory :meal_with_future_pickup_date do
      pickup_time { 20.days.from_now }
    end

    name { 'Soup' }
    description { 'Nice and warm' }
    cook_provides_packaging { true }
    amount { 2 }
    address { 'Vej 29' }
    city { 'København' }
    zip { 2450 }
    pickup_time { Time.parse('2012-10-10') }
    user
  end
end
