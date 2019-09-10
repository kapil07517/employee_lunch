class CreateLunches < ActiveRecord::Migration[5.2]
  def change
    create_table :lunches do |t|
      t.datetime :starts_at
      t.references :leader, index: true, foreign_key: { to_table: :users }
      t.references :restaurant, index: true, foreign_key: {to_table: :restaurants}

      t.timestamps
    end

    create_table :lunches_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :lunch, index: true
    end
  end
end
