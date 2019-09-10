# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  nickname               :string
#  first_name             :string           default(""), not null
#  last_name              :string           default(""), not null
#  assist_next_lunch      :boolean          default(TRUE), not null
#  unit_id                :bigint
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :validatable

  has_many :lunches
  has_and_belongs_to_many :lunches

  validates_presence_of :first_name, :email

  def short_name
    nickname || first_name
  end

  def lunch_confirmation(vote)
    self.assist_next_lunch = vote.to_i == 1
    save
  end
end
