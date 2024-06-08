class CreateDailyChores < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_chores do |t|
      t.references :chore, null: false, foreign_key: true

      t.timestamps
    end
  end
end
