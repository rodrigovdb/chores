class DailyChore < ApplicationRecord
  belongs_to :chore

  validates :chore, presence: true
end
