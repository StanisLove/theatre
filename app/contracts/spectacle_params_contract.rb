class SpectacleParamsContract < Dry::Validation::Contract
  params do
    required(:spectacle).hash do
      required(:title).filled(:string)
      optional(:description).value(:string)
    end
  end
end
