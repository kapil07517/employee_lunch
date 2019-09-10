# frozen_string_literal: true

class NewLunchJob < ApplicationJob
  queue_as :default

  def perform(user)
    @user = user
    LunchMailer.new_lunch(user).deliver_later
  end
end
