# frozen_string_literal: true

class AddSlugToChore < ActiveRecord::Migration[7.0]
  def change
    add_column :chores, :slug, :string

    Chore.find_each { |chore| chore.update(slug: chore.name.parameterize) }
  end
end
