require 'order'

describe Order do
  subject(:order){described_class.new}

  it 'initialize with no items listed'do
    expect(order.list).to be_empty
  end

  describe '#add_item' do
    it 'should be able to order three of the same menu item' do
      order.add_item(:rice, 3)
      expect(order.list).to include(rice: 3)
    end

    it 'should add additional quantity to duplicate item quantity' do
      order.add_item(:rice, 3)
      order.add_item(:rice, 4)
      expect(order.list).to include(rice: 7)
    end
  end
end
