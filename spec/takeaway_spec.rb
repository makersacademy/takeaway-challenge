require 'takeaway'

describe Takeaway do
  let(:takeaway) {described_class.new}

  describe '#menu' do
    it 'displays menu' do
      expect(takeaway.menu).to eq [{:chips => 1.80}, {:burger => 10.00}]
    end
  end
end
