# frozen_string_literal: true

class AddUserToChore < ActiveRecord::Migration[7.0]
  def change
    add_reference :chores, :user, null: true, foreign_key: true

    user_id = User.first.id
    Chore.update_all(user_id:)
  end
end
