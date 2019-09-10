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

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryBot.create(:user, unit: FactoryBot.create(:unit), first_name: 'John') }

  context 'when validation' do
    it 'is valid with valid attributes' do
      expect(user.valid?).to be(true)
    end

    it 'is invalid with no attributes' do
      user.attributes = { first_name: nil, nickname: nil }
      expect(user.valid?).to be(false)
    end
  end

  context 'when user has nickname' do
    it 'chooses the nickname over first_name' do
      user.nickname = 'Pokemon'
      expect(user.short_name).to eq 'Pokemon'
    end
  end

  context "when user hasn't nickname" do
    it 'chooses the first_name as short_Name' do
      user.nickname = nil
      expect(user.short_name).to eq 'John'
    end
  end
end
