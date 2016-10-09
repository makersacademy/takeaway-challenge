require 'restaurant'

describe Restaurant do
  subject(:restaurant)  {described_class.new}

  let(:food1) {double(:food1, food_name: 'Pizza', price: 12)}
  let(:food2) {double(:food2, food_name: 'Pasta', price: 8)}

  let(:order1) {double(:order1, food_name: 'Pizza', price: 12)}
  let(:menu) {double(:menu, menu_item1: food1, menu_item2: food2)}

  context '#menu' do

    it 'shows the menu' do
      expect(restaurant).to respond_to(:show_menu)
    end

    it 'has a menu' do
      restaurant.menu = menu
      expect(restaurant.show_menu).to eq menu
    end

    it 'creates a menu' do
      expect(restaurant.create_menu).to eq restaurant.menu
    end
  end

  context '#take order' do

    it 'can take the orders' do
      expect(restaurant).to respond_to(:take_orders).with(2).argument
    end
  end

  context '#verify_order' do
    before do
      allow(order1).to receive(:[]).with(:price).and_return(order1.price)
    end

    it 'updates the order verification method in order' do
      customer_order_sum = 24
      quantity = 2
      restaurant.take_orders(order1, quantity)
      restaurant.verify_order(customer_order_sum)
      expect(restaurant.order.customer_order_sum).to eq customer_order_sum
    end
  end

  context '#confirm_order' do
    before do
      allow(order1).to receive(:[]).with(:price).and_return(order1.price)
    end

    #customer_order_sum = 47

    it 'raises an error if verification failed' do
      quantity = 1
      restaurant.take_orders(order1, quantity)
      restaurant.take_orders(order1, quantity)
      expect{ restaurant.confirm_order }.to raise_error('Verification failed, sums not matching')
    end
  end
end
