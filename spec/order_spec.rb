require 'order'

describe Order do
  subject(:order) {described_class.new}

  context 'initialize' do
    it 'contains an empty list' do
      expect(order.basket).to eq({})
    end

    it 'starts with a total of 0' do
      expect(order.total).to eq(0)
    end
  end

  context '#add' do
    it 'adds items to the basket' do
      order.add("chips", 1.00, 2)
      expect(order.basket).to include("chips" => 2)
    end

    it 'keeps track of the total' do
      order.add("chips", 1.00, 3)
      expect(order.total).to eq(3)
    end

  end

end
