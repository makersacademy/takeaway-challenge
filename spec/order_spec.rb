require 'order'

describe Order do
  subject(:order) { described_class.new }

  it 'should initialize with an empty order list' do
    expect(order.list).to be_empty
  end

  describe '#order_item' do
    it 'should add items and number of items to order list' do
      order.order_item(:burger, 2)
      expect(order.list).to include(burger: 2)
    end

    it 'should add duplicate items to the original number' do
      order.order_item(:burger, 2)
      order.order_item(:burger, 3)
      expect(order.list).to include(burger: 5)
    end
  end

end
