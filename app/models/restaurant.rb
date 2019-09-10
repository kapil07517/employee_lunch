# frozen_string_literal: true

# == Schema Information
#
# Table name: restaurants
#
#  id         :bigint           not null, primary key
#  name       :string
#  address    :string
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Restaurant < ApplicationRecord
  has_many :lunches

  validates_presence_of :name, :address
end
