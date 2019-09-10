# frozen_string_literal: true

describe Tasks::LunchNewGroups, type: :task do
  context 'when users have confirmed to assist to the lunch' do
    before do
      units = []
      5.times { units << FactoryBot.create(:unit) }
      10.times.each { FactoryBot.create(:user, unit: units.sample) }
    end

    it 'runs gracefully' do
      expect { task.execute }.not_to raise_error
    end
  end

  context 'when there are no users' do
    it 'runs gracefully, nothing happens' do
      expect { task.execute }.not_to raise_error
    end
  end
end
