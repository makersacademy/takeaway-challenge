require 'order'
require 'menu'

describe Order do

  subject(:order) { described_class.new }

  let(:dish) { double :dish }
  let(:quantity) { double :quantity }
  let(:order_selection) { { dish: dish, quantity: quantity } }
  let(:total_cost) { double :total_cost }

  context 'when order_entry array is created' do
    it 'empty on intialization' do
      expect(order.order_selection).to be_empty
    end
  end

  context 'when making an order' do
    it 'select dish from menu & required quantity' do
      expect(order.selection(dish, quantity)).to eq [order_selection]
    end

    # it 'sums total price of order' do
    #   expect(order.total_cost).to eq total_cost
    # end

    # it 'raise an error if the dish is not on the menu' do
    #   menu_entry = MenuEntry.new
    #   menu_entry.add_dish(dish)
    #   menu = Menu.new
    #   menu.add_entry(menu_entry)
    #   expect{ order.select_dish(dish) }.to raise_error "Dish not available"
    # end
  end
end
