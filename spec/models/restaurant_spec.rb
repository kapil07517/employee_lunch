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

RSpec.describe Restaurant, type: :model do
  subject(:restaurant) { described_class.new }

  context 'when validation' do
    it 'is valid with presence of attributes' do
      restaurant.attributes = { name: 'name', address: 'address' }
      expect(restaurant.valid?).to be(true)
    end

    it 'is invalid with no attributes' do
      expect(restaurant.valid?).to be(false)
    end
  end
end
