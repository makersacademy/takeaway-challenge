require 'order'

describe Order do

  menu = Order::MENU

  subject(:order) { described_class.new }
  let(:dish1) { {name: 'sushi', amount: 3} }
  let(:dish2) { {name: 'ramen', amount: 1} }
  let(:basket1) { {name: 'sushi', amount: 3, price: 7} }
  let(:basket2) { {name: 'ramen', amount: 1, price: 12} }

  describe '#initialize' do
    it '1.0 initializes an order with an empty list of dishes' do
      expect(order.basket).to eq([])
    end
  end

  describe '#show_menu' do
    it '2.0 shows a list of dishes available to order with price' do
      expect(order.show_menu).to include('sushi: £7')
    end
  end

  describe '#place_order' do
    # xit '2.0 adds a dish to the basket' do
    #   order.place_order(dish1)
    #   expect(order.basket).to include(dish1)
    # end
    # it '2.1 accepts a list of dishes and expected total' do
    #   list = {name: 'sushi', amount: 3}, {name: 'ramen', amount: 1}
    #   total = 33
    # end
    it '2.2 assigns a price to each dish and adds it to the basket' do
      order.place_order(dish1, dish2, 33)
      expect(order.basket).to include(basket1 && basket2)
    end

  end

  # describe '#removes_dish' do
  #   xit '3.0 removes a dish from the basket' do
  #     order.place_order(dish2)
  #     order.remove_dish(dish2)
  #     expect(order.basket).not_to include(dish2)
  #   end
  #   it '3.1 raises an error when trying to remove non-existent dish' do
  #     message = "You did not add #{dish2[:name]}!"
  #     order.place_order(dish1)
  #     expect{order.remove_dish(dish2)}.to raise_error message
  #   end
  # end

  describe '#total' do
    it '4.0 calculates the total price of the order' do
      order.place_order(dish1, dish2, 33)
      dish1_total = dish1[:amount]*dish1[:price]
      dish2_total = dish2[:amount]*dish2[:price]
      expect(order.total).to eq(dish1_total + dish2_total)
    end
  end
end

# what order needs to know: dish_name, amount, price
# basket => hash in an array? e.g. [{dish: 'sushi', amount: 4, price: 7},...]
#           => nested array? e.g. [[sushi, 4, 7]]

# when passing in dish to place_order dish needs to know name, amount, price
# when removing dish by remove_dish, method only needs to know dish name


# methods order class should have
# - add a dish
# - remove a dish
# - calc_total
# - place_order
