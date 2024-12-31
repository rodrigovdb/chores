# frozen_string_literal: true

class ChangeNotNullOnKidUserId < ActiveRecord::Migration[7.0]
  def change
    change_column_null :kids, :user_id, false
  end
end
