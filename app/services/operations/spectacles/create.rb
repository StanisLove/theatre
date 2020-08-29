module Operations
  module Spectacles
    class Create < Operations::Base
      private

      def validate(params)
        contract = ::Spectacles::Contract.new
        contract.call(params).to_monad
      end

      def commit(params)
        spectacle = Spectacle.create(params)
        Success(spectacle)
      end
    end
  end
end
