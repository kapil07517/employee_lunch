# frozen_string_literal: true

class LunchMailer < ApplicationMailer
  def new_lunch(user)
    mail(to: user.email, subject: 'Next Friday Lunch pool')
  end

  def leader_choice(lunch)
    mail(to: lunch.user.email, subject: 'Next Friday Lunch pool')
  end
end
