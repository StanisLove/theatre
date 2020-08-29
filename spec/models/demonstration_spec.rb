RSpec.describe Demonstration do
  let(:spectacle) { create :spectacle }
  let(:start) {'2020-10-01' }
  let(:finish) { '2020-10-10' }
  let(:demo) { build :demonstration, start_date: start, finish_date: finish, spectacle: spectacle }

  specify { expect(demo).to be_valid }

  context 'without start date' do
    let(:start) { nil }

    specify { expect(demo).not_to be_valid }
  end

  context 'without finish date' do
    let(:finish) { nil }

    specify { expect(demo).not_to be_valid }
  end
end
