require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new }

  describe '#initialize' do
    it 'initializes the order with an empty basket' do
      expect(order.basket).to be_empty
    end
  end

  describe '#order_dish' do
    it 'orders a dish on the menu' do
      dish = 'Kobe Slider'
      menu_item = order.lookup_item(dish)
      order.order_dish(1, dish)
      expect(order.basket).to include(menu_item)
    end

    it 'changes the quantity of the item' do
      dish = 'Kobe Slider'
      menu_item = order.lookup_item(dish)
      order.order_dish(2, dish)
      expect(order.basket).to contain_exactly(menu_item, menu_item)
    end
  end

  describe '#lookup_item' do
    it 'looks up the item from the menu' do
      dish = 'Kobe Slider'
      expect(order.lookup_item(dish)).to eq('Kobe Slider' => 7)
    end
  end
end
