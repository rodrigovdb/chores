class Chore < ApplicationRecord
  has_many :daily_chores

  validates :name, presence: true, uniqueness: true

  before_save ->(chore) { chore.slug = chore.name.parameterize }
end
