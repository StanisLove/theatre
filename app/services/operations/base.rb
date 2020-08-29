# frozen_string_literal: true

module Operations
  class Base
    include Dry::Monads[:result, :do, :try]

    def call(params)
      validated_params = yield validate(params)
      resource = yield commit(validated_params.to_h)
      Success(resource)
    end
  end
end
