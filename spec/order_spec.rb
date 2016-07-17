require 'order'

describe Order do
  subject(:order) {described_class.new}

  context 'initialize' do
    it 'contains an empty list' do
      expect(order.items).to eq({})
    end

    it 'starts with a total of 0' do
      expect(order.total).to eq(0)
    end
  end

  context '#add' do
    it 'can respond to add' do
      expect(order).to respond_to(:add).with(3).arguments
    end

    it 'can add items to the list' do
      order.add("chips", 1.00, 2)
      expect(order.items).to include("chips" => 2)
    end

    it 'increments the total' do
      order.add("chips", 1.00, 3)
      expect(order.total).to eq(3)
    end

  end

end
