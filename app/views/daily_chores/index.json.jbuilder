# frozen_string_literal: true

json.array! @daily_chores, partial: 'daily_chores/daily_chore', as: :daily_chore
