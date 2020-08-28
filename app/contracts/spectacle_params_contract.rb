class SpectacleParamsContract < Dry::Validation::Contract
  params do
    required(:spectacle).hash do
      required(:title).filled(:string)
    end
  end
end
