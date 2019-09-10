# frozen_string_literal: true

class LeaderChoiceJob < ApplicationJob
  queue_as :default

  def perform(lunch)
    @lunch = lunch
    LunchMailer.leader_choice(lunch).deliver_later
  end
end
