# frozen_string_literal: true

class DailyChore < ApplicationRecord
  belongs_to :chore
  belongs_to :kid

  scope :for_period, ->(date_range) { where(created_at: date_range) }
  scope :for_week, ->(week) { for_period(week) }
  scope :for_this_week, -> { for_period(Date.current.all_week) }

  scope :for_day, ->(date) { for_period(date.all_day) }
  scope :for_today, -> { for_day(Date.current) }

  scope :for_chore, ->(chore) { where(chore:) }
end
