require 'order'

RSpec.describe Order do
  let(:test_order) { Order.new }

  let(:item_1) { double(:pizza, name: :pepperoni_pizza, price: 8) }
  let(:item_2) { double(:pizza, name: :margherita_pizza, price: 6) }
  let(:item_3) { double(:pizza, name: :vegetarian_pizza, price: 6) }
  let(:item_4) { double(:pizza, name: :sausage_pizza, price: 8.5) }

  let(:menu_listing_1) { double(:menu_listing, dish: item_1, servings_left: 1, unavailable?: false) }
  let(:menu_listing_2) { double(:menu_listing, dish: item_2, servings_left: 2, unavailable?: false) }
  let(:menu_listing_3) { double(:menu_listing, dish: item_3, servings_left: 4, unavailable?: false) }
  let(:menu_listing_4) { double(:menu_listing, dish: item_4, servings_left: 0, unavailable?: true) }

  let(:test_menu) { double(:menu, dishes: [menu_listing_1, menu_listing_2, menu_listing_3, menu_listing_4]) }

  it 'contains dishes ordered by the customer' do
    test_order.add_item(item_1)
    test_order.add_item(item_1)
    test_order.add_item(item_2)

    expect(test_order.view).to eq "Pepperoni Pizza – Quantity: 2\nMargherita Pizza – Quantity: 1"
  end
  
  context 'example orders' do
    context 'when calculating prices' do
      it 'calculates the total price of item 1, 2 servings of item 2 and item 4 as £28.50' do
        test_order.add_item(item_4)
        test_order.add_item(item_2)
        test_order.add_item(item_1)
        test_order.add_item(item_2)

        expect(test_order.total).to be 28.5
      end

      it 'calculates the total price of items 2 and 3 as £12' do
        test_order.add_item(item_2)
        test_order.add_item(item_3)

        expect(test_order.total).to be 12
      end
    end
  end

  describe '#remove_item' do
    it 'removes a serving of a selected item' do
      test_order.add_item(item_1)
      test_order.add_item(item_1)
      test_order.add_item(item_2)
      test_order.remove_item(item_1)

      expect(test_order.view).to eq "Pepperoni Pizza – Quantity: 1\nMargherita Pizza – Quantity: 1"
    end
  end
end
