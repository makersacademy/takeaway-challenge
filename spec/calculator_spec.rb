require 'calculator'

describe Calculator do
  let(:prices) { [10, 12] }

  subject { described_class.new }

  describe '#total' do
    it 'adds up the total cost' do
      expect(subject.total(prices)).to eq 22
    end
  end
end
