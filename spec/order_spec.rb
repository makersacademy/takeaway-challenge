require 'order'

describe Order do
  let(:food1) {double(:food1, food_name: 'Pizza', price: 12)}
  let(:food2) {double(:food2, food_name: 'Pasta', price: 8)}

  let(:order1) {double(:order1, food_name: 'Pizza', price: 12)}
  let(:menu) {double(:menu, menu_item1: food1, menu_item2: food2)}


  subject(:order) {Order.new}

  before do
    allow(order1).to receive(:[]).with(:price).and_return(order1.price)
  end

  context '#take order' do
    it 'can take the orders' do
      expect(order).to respond_to(:place_order).with(2).argument
    end

    it 'can record the orders' do

      quantity = 1
      order.place_order(order1, quantity)
      expect(order.orderlist).to eq [order1]
    end
  end
  context '#check order' do

    it 'gets price gets the price from menu * quantity' do
      order.quantity = 2
      #order.place_order(order1, quantity)
      menu_item_price = order1.price * order.quantity
      expect(order.get_price(order1)).to eq menu_item_price
    end

    it 'calculates the total amount of 2 orders' do
      quantity = 1
      order.place_order(order1, quantity)
      order.place_order(order1, quantity)
      menu_item_price = order1.price * quantity
      expect(order.total).to eq menu_item_price * 2
    end

    it 'can verify an order' do
      expect(order).to respond_to(:order_verified?)
    end

    it 'verifies an order' do
      customer_order_sum = 48
      expect(order.verify_order(customer_order_sum)).to eq order.customer_order_sum
    end
  end

  context '#delivery_time' do

    it 'returns delivery time 1 hourß from time of order' do
      delivery_time = (Time.now + 3600).strftime(" %H:%M")
      expect(delivery_time).to eq order.delivery_time
    end
  end
end
