class Chore < ApplicationRecord
  has_many :daily_chores

  validates :name, presence: true, uniqueness: true
end
