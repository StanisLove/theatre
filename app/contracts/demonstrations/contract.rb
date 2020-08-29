# frozen_string_literal: true

module Demonstrations
  class Contract < Dry::Validation::Contract
    params do
      required(:spectacle_id).filled(:integer)
      required(:start_date).filled(:date)
      required(:finish_date).filled(:date)
    end

    rule(:start_date, :finish_date) do
      key.failure('must be after start date') if values[:finish_date] < values[:start_date]
    end
  end
end
