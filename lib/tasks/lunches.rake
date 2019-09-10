# frozen_string_literal: true

namespace :lunches do
  desc 'handles the scheduled tasks for dealing with lunches'

  task pool: :environment do
    Lunch.lunch_email_pool
  end

  task new_groups: :environment do
    Lunch.new_groups
  end

  task leader_choice: :environment do
    Lunch.leader_lunch_choice
  end
end
