# frozen_string_literal: true

FactoryBot.define do
  factory :restaurant do
    name    { Faker::Restaurant.name      }
    address { Faker::Address.full_address }
    rating  { (0..5).to_a.sample          }
  end
end
