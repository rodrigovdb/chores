# frozen_string_literal: true

json.extract! daily_chore, :id, :chore_id, :created_at, :updated_at
json.url daily_chore_url(daily_chore, format: :json)
