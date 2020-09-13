require 'order'

describe Order do
  let(:order) { Order.new }
  describe '#initialize' do
    it 'creates an empty list' do
      expect(order.list).to be_an(Array)
    end
  end

  describe '#add' do
    it 'adds dishes to the order' do
      dish = "mushroom stroganoff"
      order.add("pizza")
      expect(order.list).not_to be_empty
    end
  end

  describe '#remove' do
    it 'removes a dish from the order' do
      order.add("pizza")
      order.remove("pizza")
      expect(order.list).to be_empty
    end
  end

  describe '#sum' do
    it 'shows an order total' do
      order.add("pizza")
      expect(order.sum).to eq 6.99
    end
  end

  
end