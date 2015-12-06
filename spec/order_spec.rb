require 'order'

describe Order do
  let(:order) { described_class.new}
  let(:dish) { double :dish, name: 'Satay', price: 4.50}
  let(:dish2) { double :dish, name: 'Spring rolls', price: 3.00}
  let(:quantity) { 3 }

  describe '#add' do
    it 'allows a customer to add an dish to the basket' do
      expect { order.add(dish) }.not_to raise_error
    end

    it 'stores an added dish in the basket' do
      order.add(dish)
      expect(order.basket).to have_key(dish)
    end

    it 'allows a customer to add multiples of an dish' do
      order.add(dish, quantity)
      basket = { dish => quantity }
      expect(order.basket).to eq basket
    end

    it 'stores an added dish in the basket with a default of 1' do
      order.add(dish)
      basket = { dish => 1 }
      expect(order.basket).to eq basket
    end

    it 'adds to the quantity of an dish if it is already in the order' do
      3.times { order.add(dish) }
      basket = { dish => 3 }
      expect(order.basket).to eq basket
    end
  end

  describe '#remove' do
    it 'allows a customer to remove an dish from the basket' do
      order.add(dish)
      order.remove(dish)
      expect(order.basket).to eq ({})
    end

    it 'reduces the quantity by 1' do
      2.times { order.add(dish) }
      order.remove(dish)
      expect(order.basket).to eq ({dish => 1})
    end

    it 'raises an error if customer tries to remove an dish not in basket' do
      expect{order.remove(dish)}.to raise_error 'Dish not in basket'
    end
  end

  describe '#total' do
    it 'adds up the total cost of dishes in the basket' do
      3.times { order.add(dish) }
      4.times { order.add(dish2) }
      expect(order.total).to eq (3*dish.price + 4*dish2.price)
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
