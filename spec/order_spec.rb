require 'order.rb'
require 'menu.rb'

describe Order do
  let(:menu) { double(:list => [{ :item => 1, :name => :" TOMATO, GARLIC & OREGANO ", :price => 4.95 },
    { :item => 2, :name => :" TOMATO, MOZZARELLA, BASIL ", :price => 6.4 }])
  }
  subject(:order) { described_class.new(menu) }

  it { is_expected.to respond_to(:ask_order) }

  describe '#add_item_to_order' do
    it 'adds a new item to the current order' do
      order.add_item_to_order(1, 4)
      menu.list[0][:quantity] = 4
      expect(order.food_items).to eq [menu.list[0]]
    end
  end

  describe '#check_item' do
    it 'checks that the item is in the menu' do
      expect(order.check_item(2)).to eq true
      expect(order.check_item(4)).to eq false
    end
  end

  describe '#ask_order' do
    it 'records the order' do
      order.add_item_to_order(1, 4)
      order.add_item_to_order(2, 2)
      expect(order.food_items).to eq [{ :item => 1, :name => :" TOMATO, GARLIC & OREGANO ", :price => 4.95, :quantity => 4 },
        { :item => 2, :name => :" TOMATO, MOZZARELLA, BASIL ", :price => 6.4, :quantity => 2 }]
    end
  end

  describe '#total' do
    it 'creates the total' do
      order.add_item_to_order(1, 4)
      order.add_item_to_order(2, 2)
      expect(order.total).to eq 32.6
    end
  end

end
