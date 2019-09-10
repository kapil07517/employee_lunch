# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [] do
    member do
      post 'lunch_confirmation/:vote', action: :next_lunch_confirmation, controller: :users, constraints: { vote: /1|0/ }
    end
  end

  resources :lunches, only: [] do
    member do
      post '/confirm_restaurant/:restaurant_id', action: :confirm_restaurant, controller: :lunches
    end
  end

  resources :restaurants
end
