# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  def next_lunch_confirmation
    current_user.lunch_confirmation(params[:vote])
  end
end
