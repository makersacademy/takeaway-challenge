require 'order'

describe Order do

  # menu = Order::MENU

  let(:menu) { double(:menu, find_price: [dish1_with_price]) }
  let(:menu_class) { double(:menu_class, new: menu)}
  subject(:order) { described_class.new(menu_class) }
  let(:dish1) { {name: 'sushi', amount: 3} }
  let(:dish1_with_price) { {name: 'sushi', amount: 3, price: 7} }

  describe '#initialize' do
    it '0.0 initializes an order with defalut menu' do
      expect(order.menu).to eq menu
    end
    it '0.1 initializes an order with an empty list of dishes' do
      expect(order.basket).to eq([])
    end
  end

  describe '#place_order' do
    before(:each) do
      order.place_order(dish1, 33)
    end
    it '1.0 calls find_price method on menu' do
      expect(order.menu).to have_received(:find_price)
    end
    it '1.1 adds dishes (with price info) to the basket' do
      expect(order.basket).to include(dish1_with_price)
    end
  end

  describe '#total' do
    it '2.0 calculates the total price of the order' do
      order.place_order(dish1, 33)
      dish1_total = dish1_with_price[:amount]*dish1_with_price[:price]
      expect(order.total).to eq(dish1_total)
    end
  end
end
