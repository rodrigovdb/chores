# frozen_string_literal: true

class CreateKidChores < ActiveRecord::Migration[7.0]
  def change
    create_table :kid_chores do |t|
      t.references :kid, null: false, foreign_key: true
      t.references :chore, null: false, foreign_key: true

      t.timestamps
    end
  end
end
