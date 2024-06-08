# frozen_string_literal: true

class AddUniqueConstraintToNameOnChores < ActiveRecord::Migration[7.0]
  def change
    add_index :chores, :name, unique: true
  end
end
