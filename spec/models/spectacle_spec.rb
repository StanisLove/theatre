RSpec.describe Spectacle do
  let(:spectacle) { build :spectacle }

  specify { expect(spectacle).to be_valid }

  context 'without title' do
    let(:spectacle) { build :spectacle, title: nil }

    specify { expect(spectacle).not_to be_valid }
  end

  context 'with same name' do
    before { create :spectacle }

    specify { expect(spectacle).not_to be_valid }
  end
end
