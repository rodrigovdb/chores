# frozen_string_literal: true

class KidChore < ApplicationRecord
  belongs_to :kid
  belongs_to :chore

  validates_presence_of :kid
  validates_presence_of :chore

  delegate :name, to: :chore
end
