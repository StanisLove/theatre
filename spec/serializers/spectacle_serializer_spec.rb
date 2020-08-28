RSpec.describe SpectacleSerializer do
  subject { described_class.new([spectacle], links: links) }

  let(:spectacle) { create :spectacle }
  let(:links) do
    {
      first: '/path/to/first/page',
      last: '/path/to/last/page',
      next: '/path/to/next/page'
    }
  end
  let(:attributes) do
    spectacle.values.select do |attr|
      %i[title description].include?(attr)
    end
  end

  it 'returns spectacle representation' do
    expect(subject.serializable_hash).to a_hash_including(
      data: [
        {
          id: spectacle.id.to_s,
          type: :spectacle,
          attributes: attributes
        }
      ],
      links: links
    )
  end
end
