# frozen_string_literal: true

RSpec.describe Operations::Demonstrations::Create do
  subject { described_class.new }

  let(:spectacle) { create :spectacle }
  let(:params) do
    Hash[finish_date: finish_date, start_date: start_date, spectacle_id: spectacle.id]
  end
  let(:start_date) { '2020-10-01' }
  let(:finish_date) { '2020-10-10' }

  describe '#call' do
    context 'when params invalid' do
      it 'returns failure' do
        result = subject.call({})
        expect(result).to be_a(Dry::Monads::Failure)
        expect(result.failure).to include(code: :validation_error)
      end
    end

    context 'when params valid' do
      it 'returns demonstration' do
        result = subject.call(params)
        expect(result).to be_a(Dry::Monads::Success)
        expect(result.value!).to be_a(Demonstration)
      end
    end
  end
end
