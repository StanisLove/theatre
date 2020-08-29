# frozen_string_literal: true

FactoryBot.define do
  sequence(:title) do |n|
    "Title #{n}"
  end

  sequence(:start_date) do |n|
    "#{2000 + n}-01-01"
  end

  sequence(:finish_date) do |n|
    "#{2000 + n}-11-01"
  end
end
