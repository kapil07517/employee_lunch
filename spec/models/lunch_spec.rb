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

require 'rails_helper'

RSpec.describe Lunch, type: :model do
  subject(:lunch) do
    described_class.create(
      leader: FactoryBot.create(:user, unit: FactoryBot.create(:unit)),
      restaurant: FactoryBot.create(:restaurant),
      starts_at: Date.today.next_occurring(:friday)
    )
  end

  context 'when validation' do
    it 'is valid with valid attributes' do
      expect(lunch.valid?).to be(true)
    end

    it 'is invalid with no attributes' do
      lunch.attributes = { leader: nil, restaurant: nil }
      expect(lunch.valid?).to be(false)
    end
  end

  context 'when pool is sent' do
    it 'queues mail when a pool is sent' do
      FactoryBot.create(:user, unit: FactoryBot.create(:unit))
      expect { described_class.lunch_email_pool }.to change { Delayed::Job.count }.by(1)
    end
  end

  context 'when leader_lunch_choice is sent' do
    it 'queues mail when a leader_lunch_choice is sent' do
      lunch
      expect { described_class.leader_lunch_choice }.to change { Delayed::Job.count }.by(1)
    end
  end
end
