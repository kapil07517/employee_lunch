# frozen_string_literal: true

class RestaurantsController < ApplicationController
  def index
    # List Restaurants for the leader to pick
    @restaurants = Restaurant.all
  end

  def new
    Restaurant.new
  end

  def create
    Restaurant.create(restaurant_params)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end
end
