# frozen_string_literal: true

describe Tasks::LunchLeaderChoice, type: :task do
  context 'when there are groups defined for next lunch' do
    before do
      unit       = FactoryBot.create(:unit)
      leader     = FactoryBot.create(:user, unit: unit)
      restaurant = FactoryBot.create(:restaurant)

      FactoryBot.create(:lunch, leader: leader, restaurant: restaurant, starts_at: Date.today.next_occurring(:friday))
    end

    it 'runs gracefully' do
      expect { task.execute }.not_to raise_error
    end
  end

  context 'when there are no groups' do
    it 'runs gracefully' do
      expect { task.execute }.not_to raise_error
    end
  end
end
