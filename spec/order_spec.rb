require 'order'

describe Order do
  let(:order) { described_class.new}
  let(:item) { double :item, name: 'Satay', price: 4.50}
  let(:item2) { double :item, name: 'Spring rolls', price: 3.00}
  let(:quantity) { 3 }

  describe '#add' do
    it 'allows a customer to add an item to the basket' do
      expect { order.add(item) }.not_to raise_error
    end

    it 'stores an added item in the basket' do
      order.add(item)
      expect(order.basket).to have_key(item)
    end

    it 'allows a customer to add multiples of an item' do
      order.add(item, quantity)
      basket = { item => quantity }
      expect(order.basket).to eq basket
    end

    it 'stores an added item in the basket with a default of 1' do
      order.add(item)
      basket = { item => 1 }
      expect(order.basket).to eq basket
    end

    it 'adds to the quantity of an item if it is already in the order' do
      3.times { order.add(item) }
      basket = { item => 3 }
      expect(order.basket).to eq basket
    end
  end

  describe '#remove' do
    it 'allows a customer to remove an item from the basket' do
      order.add(item)
      order.remove(item)
      expect(order.basket).to eq ({})
    end

    it 'reduces the quantity by 1' do
      2.times { order.add(item) }
      order.remove(item)
      expect(order.basket).to eq ({item => 1})
    end

    it 'raises an error if customer tries to remove an item not in basket' do
      expect{order.remove(item)}.to raise_error 'Item not in basket'
    end
  end

  describe '#total' do
    it 'adds up the total cost of items in the basket' do
      3.times { order.add(item) }
      4.times { order.add(item2) }
      expect(order.total).to eq (3*item.price + 4*item2.price)
    end
  end

  describe '#confirm' do
    it 'outputs a delivery time message when an order has been placed' do
      delivery_time = (Time.new + 3600).strftime("%H:%M")
      message = "Thank you! Your order was placed and will be delivered by #{delivery_time}"
      expect(order.confirm).to eq message
    end
  end
end
