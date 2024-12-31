# frozen_string_literal: true

class Chore < ApplicationRecord
  belongs_to :user

  has_many :kid_chores, dependent: :destroy
  has_many :daily_chores, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  before_save ->(chore) { chore.slug = chore.name.parameterize }
end
