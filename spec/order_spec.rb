require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:dish1) { {name: 'sushi', amount: 3, price: 7} }
  let(:dish2) { {name: 'ramen', amount: 1, price: 12} }

  describe '#initialize' do
    it '1.0 initializes an order with an empty list of dishes' do
      expect(order.dish_list).to eq([])
    end
  end

  describe '#add_dish' do
    it '2.0 adds a dish to the dish_lsit' do
      order.add_dish(dish1)
      expect(order.dish_list).to include(dish1)
    end
    # it '2.1 raises an error if the dish is not in the list' do
    # end
  end

  describe '#removes_dish' do
    it '3.0 removes a dish from the dish_list' do
      order.add_dish(dish2)
      order.remove_dish(dish2)
      expect(order.dish_list).not_to include(dish2)
    end
    it '3.1 raises an error when trying to remove non-existent dish' do
      message = "You did not add #{dish2[:name]}!"
      order.add_dish(dish1)
      expect{order.remove_dish(dish2)}.to raise_error message
    end
  end

  describe '#total' do
    it '4.0 calculates the total price of the order' do
      order.add_dish(dish1)
      order.add_dish(dish2)
      dish1_total = dish1[:amount]*dish1[:price]
      dish2_total = dish2[:amount]*dish2[:price]
      expect(order.total).to eq(dish1_total + dish2_total)
    end
  end
end

# what order needs to know: dish_name, amount, price
# dish_list => hash in an array? e.g. [{dish: 'sushi', amount: 4, price: 7},...]
#           => nested array? e.g. [[sushi, 4, 7]]

# when passing in dish to add_dish dish needs to know name, amount, price
# when removing dish by remove_dish, method only needs to know dish name


# methods order class should have
# - add a dish
# - remove a dish
# - calc_total
# - place_order
