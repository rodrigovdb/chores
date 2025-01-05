# frozen_string_literal: true

FactoryBot.define do
  factory :chore do
    user

    name { "#{Faker::Verb.simple_present} #{Faker::Construction.material}" }
  end
end
