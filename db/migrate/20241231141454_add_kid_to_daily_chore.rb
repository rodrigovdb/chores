class AddKidToDailyChore < ActiveRecord::Migration[7.0]
  def change
    add_reference :daily_chores, :kid, null: true, foreign_key: true
  end
end
