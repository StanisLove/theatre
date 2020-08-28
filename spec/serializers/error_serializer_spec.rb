RSpec.describe ErrorSerializer do
  subject { described_class }

  describe '.from_messages' do
    context 'with single error message' do
      let(:message) { 'Error message' }

      it 'returns errors representation' do
        expect(subject.from_message(message)).to eq(
          errors: [
            { detail: message }
          ]
        )
      end
    end

    context 'with multiple error messages' do
      let(:messages) { ['Error message 1', 'Error message 2'] }

      it 'returns errors representation' do
        expect(subject.from_messages(messages)).to eq(
          errors: [
            { detail: messages[0] },
            { detail: messages[1] }
          ]
        )
      end
    end

    context 'with meta' do
      let(:message) { 'Error message' }
      let(:meta) { Hash[level: 'error'] }

      it 'returns errors representation' do
        expect(subject.from_message(message, meta: meta)).to eq(
          errors: [
            {
              detail: message,
              meta: meta
            }
          ]
        )
      end
    end
  end

  describe '.from_model' do
    let(:model) do
      double(
        'model',
        errors: {
          blue: ['Error 1'],
          green: ['Error 1', 'Error 2']
        }
      )
    end

    it 'returns errors representation' do
      expect(subject.from_model(model)).to eq(
        errors: [
          {
            detail: 'Error 1',
            source: {
              pointer: '/data/attributes/blue'
            }
          },
          {
            detail: 'Error 1',
            source: {
              pointer: '/data/attributes/green'
            }
          },
          {
            detail: 'Error 2',
            source: {
              pointer: '/data/attributes/green'
            }
          }
        ]
      )
    end
  end
end
