# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Broder Salsa' }
    email { 'broder@salsa.dk' }
    password { '12345678' }

    factory :meals_and_orders do
      transient do
        meals_count { 2 }
      end

      after(:create) do |user, evaluator|
        create_list(:meal_with_past_pickup_date, evaluator.meals_count, user: user)
        create_list(:meal_with_future_pickup_date, evaluator.meals_count, user: user)
        create_list(:order_with_past_pickup_date, evaluator.meals_count, user: user)
        create_list(:order_with_future_pickup_date, evaluator.meals_count, user: user)
      end
    end
  end
end
