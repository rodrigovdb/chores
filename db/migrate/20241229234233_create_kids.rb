# frozen_string_literal: true

class CreateKids < ActiveRecord::Migration[7.0]
  def change
    create_table :kids do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
