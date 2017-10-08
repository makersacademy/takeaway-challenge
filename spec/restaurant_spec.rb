require 'restaurant'
require 'menu'
require 'dish'

describe Restaurant do
  let(:menu) { Menu.new }
  let(:restaurant) { described_class.new(menu) }
  let(:order) { Order.new("pizza") }
  let(:dish) {Dish.new("pizza")}
  describe '#see_menu' do
    it 'allows the customer to see the menu' do
      menu_given = menu.change_menu_to_string
      expect(restaurant.see_menu).to eq(menu_given)
    end
  end

  describe '#add_order' do
    it 'adds a new order when this is made' do
      orders = restaurant.orders
      expect{ restaurant.submit_order(order) }.to change {orders.count}.by(1)
    end
  end



end
