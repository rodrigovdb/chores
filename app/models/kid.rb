# frozen_string_literal: true

class Kid < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: { scope: %i[user_id] }
end
