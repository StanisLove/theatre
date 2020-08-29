module Operations
  module Demonstrations
    class Create < Operations::Base
      private

      def validate(params)
        contract = ::Demonstrations::Contract.new
        contract.call(params).to_monad
      end

      def commit(params)
        demonstration = Demonstration.create(params)
        Success(demonstration)
      end
    end
  end
end
