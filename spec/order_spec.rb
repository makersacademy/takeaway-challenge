require 'order'

# selects items from menu to add to basket
# removes unwanted items from basket

describe Order do
subject(:order) { described_class.new }

let(:menu_item) { double :menu_item, :item => item, :price => price }
let(:item) { double :item }
let(:price) { double :price }

it { is_expected.to respond_to(:add_item) }
it { is_expected.to respond_to(:show_basket) }
it { is_expected.to respond_to(:delete_item) }

  describe '#add_item' do
    it 'adds a menu item to the basket' do
      order.add_item(menu_item)
      expect(order.basket).to include menu_item
    end
  end

  # describe '#show_basket' do
  #   it 'shows menu items currently in basket' do
  #     expect(order.show_basket).to [basket]
  #   end
  # end

  describe '#delete_item' do
    it 'removes item from basket' do
      order.add_item(menu_item)
      expect(order.delete_item(menu_item)).not_to include menu_item
    end
  end

end
