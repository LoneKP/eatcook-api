# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :meals, only: %i[index show create] do
    get :meal_image, on: :member
  end
  resources :orders, only: %i[create index]
  post 'auth/register', to: 'users#register'
  post 'auth/login', to: 'users#login'

  get 'user/meals/past', to: 'meals#meals_cooked_by_user_in_the_past'
  get 'user/meals/future', to: 'meals#meals_to_be_cooked_by_user_in_the_future'
  get 'user/orders/past', to: 'orders#meals_ordered_by_user_in_the_past'
  get 'user/orders/future', to: 'orders#meals_to_be_ordered_by_user_in_the_future'
  get 'user', to: 'users#show'
  post 'user/update', to: 'users#update'
  post '/image/:meal_id', to: 'meals#attach_image'

  get 'user/meals/pickups/:id', to: 'meals#future_meal_handouts'
  get 'user/orders/pickups/:id', to: 'orders#future_order_pickups'
end
