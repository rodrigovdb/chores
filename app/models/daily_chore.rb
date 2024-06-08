class DailyChore < ApplicationRecord
  belongs_to :chore

  validates :chore, presence: true

  scope :for_this_week, -> { where(created_at: Date.current.beginning_of_week..Date.current.end_of_week) }
  scope :for_day, ->(date) { where(created_at: date.all_day) }
  scope :for_chore, ->(chore) { where(chore:) }
  scope :for_today, -> { for_day(Date.current) }
end
