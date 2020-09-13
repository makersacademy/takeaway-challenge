require 'order'

order = Order.new 

describe Order do
  
  describe '#initialize' do
    it 'creates an empty list' do
      expect(order.list).to be_an(Array)
    end
  end

  describe '#add' do
    it 'adds dishes to the order' do
      order.add("spring rolls")
      expect(order.list).to include "spring rolls"
    end
  end

  describe '#remove' do
    it 'removes a dish from the order' do
      order.add("spring rolls")
      order.remove("spring rolls")
      expect(order.list).to be_empty
    end
  end

  describe '#check_total' do
    it 'shows an order total' do
      order.add("spring rolls")
      expect(order.check_total).to eq 4.45
    end
  end

  describe '#verify' do
    it 'returns true if the amount entered agrees with the total' do
      allow(order).to receive(:check_total).and_return 4.45
      expect(order.verify(4.45)).to eq true
    end

    it "raises an error if the total doesn't agree" do
      allow(order).to receive(:check_total).and_return 5.25
      expect { order.verify(4.45) }.to raise_error "The total is incorrect"
    end
  end

  
end