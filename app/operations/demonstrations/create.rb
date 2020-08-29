module Operations
  module Demonstrations
    class Create < Operations::Base
      private

      def validate(params)
        contract = Demonstrations::Contract.new(
          free_dates_validator: Demonstrations::FreeDatesValidator
        )
        contract.call(params).to_monad
      end

      def commit(params)
        demonstration = Demonstration.create(params)
        Success(demonstration)
      end
    end
  end
end
