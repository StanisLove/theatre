# frozen_string_literal: true

module Spectacles
  class Contract < Dry::Validation::Contract
    params do
      required(:title).filled(:string)
      optional(:description).value(:string)
    end
  end
end
