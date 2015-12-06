require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) { double(:menu, contents: menu_dishes) }
  let(:menu_dishes) { {'Dish 1' => 5.00,'Dish 2' => 6.00,'Dish 3' => 7.00} }
  let(:order) { double(:order, list: order_dishes) }
  # let(:order_dishes) { double(:order_dishes) }

  describe '#read_menu' do
    it 'lists the items on the menu' do
      expect(takeaway.read_menu).to include menu_dishes
    end
  end

  describe '#order' do
    it 'allows the user to select their preferred dishes' do
      takeaway.order('Dish 1': 3, 'Dish 2': 1)
      expect(order.list).to include('Dish 1': 3, 'Dish 2': 1)
    end
  end
end
