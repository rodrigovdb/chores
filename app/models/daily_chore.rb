class DailyChore < ApplicationRecord
  belongs_to :chore

  validates :chore, presence: true

  scope :for_this_week, -> { where(created_at: Date.current.beginning_of_week..Date.current.end_of_week) }
  scope :for_today, -> { where(created_at: Date.current.all_day) }
end
