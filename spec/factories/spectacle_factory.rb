# frozen_string_literal: true

FactoryBot.define do
  factory :spectacle do
    title { generate(:title) }
    description { 'Spectacle description' }
  end
end
