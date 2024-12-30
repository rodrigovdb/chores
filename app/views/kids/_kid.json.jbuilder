# frozen_string_literal: true

json.extract! kid, :id, :user_id, :name, :created_at, :updated_at
json.url kid_url(kid, format: :json)
