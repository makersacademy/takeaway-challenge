require 'restaurant'

describe Restaurant do
  subject(:restaurant)  {described_class.new}

  let(:food1) {double(:food1, food_name: 'Pizza', price: 12)}
  let(:food2) {double(:food2, food_name: 'Pasta', price: 8)}

  let(:order) {double(:order, food_name: food1, quantity: 2)}
  let(:menu) {double(:menu, menu_item1: food1, menu_item2: food2)}

  context '#menu' do

    it 'shows the menu' do
      expect(restaurant).to respond_to(:show_menu)
    end
    it 'has a menu' do
      restaurant.menu = menu
      expect(restaurant.show_menu).to eq menu
    end
  end

  context '#take order' do
    it 'can take the orders' do
      expect(restaurant).to respond_to(:take_orders).with(1).argument
    end

    it 'can record the orders' do
      restaurant.take_orders(order)
      expect(restaurant.order).to eq [order]
    end
  end

  context '#check order' do


    it 'gets price gets the price of the food * quantity' do
      menu_item_price = order.food_name.price * order.quantity
      expect(restaurant.get_price(order)).to eq menu_item_price
    end

    it 'calculates the total amount of 2 orders' do
      restaurant.take_orders(order)
      restaurant.take_orders(order)
      menu_item_price = order.food_name.price * order.quantity
      expect(restaurant.total()).to eq menu_item_price * 2
    end

    it 'can verify an order' do
      expect(restaurant).to respond_to(:order_verified?)
    end

    it 'verifies an order' do
      customer_order_sum = 48
      expect(restaurant.verify_order(customer_order_sum)).to eq restaurant.customer_order_sum
    end
  end

  context '#confirm_order'
  p t = Time.new
  p h = t + 3600
  p f = (t + 3600).strftime(" %H:%M")

    it 'raises an error if verification failed' do
      restaurant.take_orders(order)
      restaurant.take_orders(order)
      restaurant.customer_order_sum = 47
      expect{ restaurant.confirm_order }.to raise_error('Verification failed, sums not matching')

    end




end
