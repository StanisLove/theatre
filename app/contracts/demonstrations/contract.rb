module Demonstrations
  class Contract < Dry::Validation::Contract
    option :free_dates_validator

    params do
      required(:spectacle_id).filled(:string)
      required(:start_date).filled(:date)
      required(:finish_date).filled(:date)
    end

    rule(:start_date, :finish_date) do
      key.failure("must be after start date") if values[:finish_date] < values[:start_date]
    end

    rule(:start_date, :finish_date) do
      unless free_dates_validator.valid?(values.slice(:start_date, :finish_date))
        key.failure("these dates are not free")
      end
    end
  end
end
