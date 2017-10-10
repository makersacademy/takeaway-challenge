require 'restaurant'
require 'menu'
require 'dish'

describe Restaurant do
  let(:order) { double :order, items: Hash.new(0) }
  let(:dish) { double :dish, name: "pizza", price: 5.00  }
  let(:menu) { double :menu, dishes: [dish] }
  let(:restaurant) { described_class.new(menu, order) }

  # describe '#see_menu' do
  #   it 'allows the customer to see the menu' do
  #     menu_given = menu.change_menu_to_string
  #     expect(restaurant.see_menu).to eq(menu_given)
  #   end
  # end

  describe '#add_dish_to_orders' do
    it 'adds a new order when this is made' do
        allow(order).to receive(:add_dish).with(dish).and_return(1)
        expect(restaurant.add_dish_to_orders(1)).to eq("You have ordered option 1")

    end
  end





end
