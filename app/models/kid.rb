# frozen_string_literal: true

class Kid < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: { scope: %i[user_id] }

  has_many :kid_chores, dependent: :destroy
  has_many :chores, through: :kid_chores

  accepts_nested_attributes_for :chores, allow_destroy: true, reject_if: proc { |id| id.blank? }
end
