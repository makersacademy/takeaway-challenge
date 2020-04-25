require 'takeaway'

describe Takeaway do
  let(:takeaway) {described_class.new}

  describe '#menu' do
    it 'displays menu' do
      expect(takeaway.menu).to eq [{:chips => 1.80}, {:burger => 10.00}]
    end
  end

  describe '#order' do
    it 'takeaway responds to method order' do
      expect(takeaway).to respond_to(:order)
    end
  end
end
