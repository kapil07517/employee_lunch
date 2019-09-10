# frozen_string_literal: true

# == Schema Information
#
# Table name: lunches
#
#  id            :bigint           not null, primary key
#  starts_at     :datetime
#  leader_id     :bigint
#  restaurant_id :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Lunch < ApplicationRecord
  belongs_to :leader, class_name: :User
  belongs_to :restaurant
  has_and_belongs_to_many :users

  validates_presence_of :leader, :restaurant

  # Range of diners per lunch
  DINERS_MIN = 3
  DINERS_MAX = 9

  def self.lunch_email_pool
    User.all.each { |user| NewLunchJob.perform_later(user) }
  end

  def self.leader_lunch_choice
    lunches = this_week_lunches
    lunches.each { |lunch| LeaderChoiceJob.perform_later(lunch) }
  end

  def self.new_groups
    users_per_lunch = rand(DINERS_MIN..DINERS_MAX)
    users           = User.where(assist_next_lunch: true).shuffle
    groups          = users.in_groups_of(users_per_lunch, false)

    groups.each do |group|
      lunch        = Lunch.new(starts_at: Date.today.next_occurring(:friday))
      lunch.leader = group.sample
      lunch.users << group
      lunch.save
    end
  end

  def self.this_week_lunches
    where('starts_at > ?', DateTime.now)
  end
end
