RSpec.describe Demonstration do
  let(:spectacle) { create :spectacle }
  let(:demo) { build :demonstration, spectacle: spectacle }

  specify { expect(demo).not_to be_valid }

  context 'with dates' do
    let(:demo) do
      build :demonstration, from: '2020-10-01', to: '2020-10-10', spectacle: spectacle
    end

    specify { expect(demo).to be_valid }
  end
end
