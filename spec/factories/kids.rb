# frozen_string_literal: true

FactoryBot.define do
  factory :kid do
    user
    name { Faker::Name.name }
  end
end
