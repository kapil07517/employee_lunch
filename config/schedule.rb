# frozen_string_literal: true

# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

every :monday, at: '5pm' do # the app sends a survey to determine which user will attend the week's lunch.
  rake 'lunches:pool'
end

# every :wednesday, at: '5pm' do
#   rake "lunches:friendly_remember"
# end

every :thrusday, at: '6am' do # creates this week lunch groups.
  rake 'lunches:new_groups'
end

every :thrusday, at: '7am' do # informs the user about being lunch leader this week, so she can pick the restaurant.
  rake 'lunches:leader_choice'
end
