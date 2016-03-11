require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:dish1) { double(:menu) }
  let(:dish2) { double(:menu) }

  describe '#initialize' do
    it '1.0 initializes an order with an empty list of dishes' do
      expect(order.dish_list).to eq([])
    end
  end

  describe '#add a dish from order' do
    it '2.0 adds a dish to the dish_lsit' do
      order.add_dish(dish1)
      expect(order.dish_list).to include(dish1)
    end
    it '2.1 raises an error if the dish is not in the list' do
    end
  end

  describe '#removes a dish from order' do
    it '3.0 removes a dish from the dish_list' do
      order.add_dish(dish2)
      order.remove_dish(dish2)
      expect(order.dish_list).not_to include(dish2)
    end
  end
end


# what order needs to know: dish_name, amount, price
# dish_list => hash in an array? e.g. [{dish_name: 'sushi', amount: 4, price: 7},...]
#           => nested array? e.g. [[sushi, 4, 7]]

# when passing in dish to add/remove_dish... dish needs to know name, amount, price


# methods order class should have
# - add a dish
# - remove a dish
# - calc_total
# - send order
# - cancel_order
