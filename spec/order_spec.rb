require 'order'

describe Order do

  subject(:order) {described_class.new}

  describe '#add(item)' do
    it 'adds item to basket' do
      order.add("margherita")
      expect(order.instance_variable_get(:@basket)).to include "Margherita"
    end

    it 'adds to subtotal' do
      order.add("margherita")
      expect(order.instance_variable_get(:@subtotal)).to eq 6
    end

    it 'records the quantity of an item' do
      2.times {order.add("margherita")}
      expect(order.instance_variable_get(:@basket)["Margherita"]).to eq 2
    end
  end

  describe '#remove(item)' do
    before do
      order.add("margherita")
      2.times {order.add("pepperoni")}
    end
    it 'removes an item from basket' do
      order.remove("margherita")
      expect(order.instance_variable_get(:@basket)).not_to include "Margherita"
    end
    it 'removes only one of an item when there are multiple' do
      order.remove("pepperoni")
      expect(order.instance_variable_get(:@basket)["Pepperoni"]).to eq 1
    end
    it 'removes the price of item from the subtotal' do
      order.remove("margherita")
      expect(order.instance_variable_get(:@subtotal)).to eq 14
    end
    it 'removes the price of only one item when removing one of several' do
      order.remove("pepperoni")
      expect(order.instance_variable_get(:@subtotal)).to eq 13
    end
    it 'raises an error when the item to delete is not in the basket' do
      msg = 'Item not in basket'
      expect {order.remove("hawaiian")}.to raise_error msg
    end
  end
end
