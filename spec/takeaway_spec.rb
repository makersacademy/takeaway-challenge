require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  it { is_expected.to respond_to :check_basket }

  describe '#check_basket' do
    it 'starts as an empty basket' do
      expect(takeaway.check_basket).to be_empty
    end
  end

  describe '#total' do
    it 'starts as a total of zero' do
      expect(takeaway.total).to eq '£0.00'
    end
  end
end
