# frozen_string_literal: true

RSpec.describe DemonstrationSerializer do
  subject { described_class.new([demonstration], links: links) }

  let(:spectacle) { create :spectacle }
  let(:demonstration) { create :demonstration, spectacle: spectacle }
  let(:links) do
    {
      first: '/path/to/first/page',
      last: '/path/to/last/page',
      next: '/path/to/next/page'
    }
  end
  let(:attributes) do
    demonstration.values.select do |attr|
      %i[start_date finish_date].include?(attr)
    end
  end

  it 'returns demonstration representation' do
    expect(subject.serializable_hash).to a_hash_including(
      data: [
        {
          id: demonstration.id.to_s,
          type: :demonstration,
          attributes: attributes,
          relationships: {
            spectacle: {
              data: { id: spectacle.id.to_s, type: :spectacle }
            }
          }
        }
      ],
      links: links
    )
  end
end
