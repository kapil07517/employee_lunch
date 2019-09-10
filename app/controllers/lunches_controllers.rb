# frozen_string_literal: true

class LunchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lunch, :set_restaurant, only: %i[confirm_restaurant]

  def confirm_restaurant
    return action_not_allowed if current_user != @lunch.leader

    @lunch.update(restaurant: @restaurant)
    flash.now[:notice] = 'Yay! Enjoy the lunch.'
    redirect_to restaurants_path
  end

  private

  def set_lunch
    @lunch = Lunch.find(params[:id])
  end

  def set_restaurant
    @lunch = Lunch.find_by_restaurant(params[:restaurant_id])
  end

  def action_not_allowed
    flash.now[:notice] = 'You are not allowed to choose the restaurant.'
  end
end
