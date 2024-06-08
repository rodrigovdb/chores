# frozen_string_literal: true

class CreateChores < ActiveRecord::Migration[7.0]
  def change
    create_table :chores do |t|
      t.string :name

      t.timestamps
    end
  end
end
