require 'order'

# selects items from menu to add to basket
# removes unwanted items from basket

describe Order do
subject(:order) { described_class.new }

let(:menu_item) { double :menu_item }

  describe '#add_item' do
    it 'adds a menu item to the basket' do
      order.add_item(menu_item)
      expect(order.basket).to include menu_item
    end
  end


end
