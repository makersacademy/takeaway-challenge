require 'order'

describe Order do
  subject(:order) {described_class.new}

  describe '#add_item' do

    it 'adds selected item to the order' do
      expect(order.add_item(1)).to eq [{"Won Ton Soup" => 8}]
    end
  end

  describe '#total' do

    it 'totals the items in the order' do
      order.add_item(1)
      expect(order.total).to eq 8
    end
  end

  describe '#view_order' do

    it 'displays the current order with a subtotal' do
      order.add_item(1)
      order.add_item(2)
      expect(order.view_order).to eq "Items: Won Ton Soup = 8, Chilli Chicken = 6, Total: 14"
    end
  end

  describe '#checkout' do
    it 'should successfully checkout if called with correct total' do
      order.add_item(1)
      order.add_item(2)
      expect(order.checkout(14)).to eq "Thank you your order has been placed"
    end

    it 'should raise an error if called with incorrect total' do
      order.add_item(1)
      order.add_item(2)
      expect{order.checkout(13)}.to raise_error("Error - the total is incorrect")
    end
  end
end


