# frozen_string_literal: true

class KidChore < ApplicationRecord
  belongs_to :kid
  belongs_to :chore

  delegate :name, to: :chore
end
