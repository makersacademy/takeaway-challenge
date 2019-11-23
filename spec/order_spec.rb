require 'order'

RSpec.describe Order do
  let(:test_order) { Order.new }
  let(:item_1) { double(:pizza, name: :pepperoni_pizza, price: 8) }
  let(:item_2) { double(:pizza, name: :margherita_pizza, price: 6) }
  let(:item_3) { double(:pizza, name: :vegetarian_pizza, price: 6) }
  let(:item_4) { double(:pizza, name: :sausage_pizza, price: 8.5) }
  let(:listing_1) { double(:listing, dish: item_1, servings_left: 2) }
  let(:listing_2) { double(:listing, dish: item_2, servings_left: 1) }
  let(:listing_3) { double(:listing, dish: item_3, servings_left: 3) }
  let(:listing_4) { double(:listing, dish: item_4, servings_left: 7) }

  it 'contains dishes ordered by the customer' do
    test_order.add_item(item_1)
    test_order.add_item(item_2)

    expect(test_order.view).to eq [:pepperoni_pizza, :margherita_pizza]
  end

  context 'when calculating prices' do
    it 'calculates the total price of items 1, 2 and 4 as £22.50' do
      test_order.add_item(item_4)
      test_order.add_item(item_2)
      test_order.add_item(item_1)

      expect(test_order.total).to be 22.5
    end

    it 'calculates the total price of items 2 and 3 as £12' do
      test_order.add_item(item_2)
      test_order.add_item(item_3)

      expect(test_order.total).to be 12
    end
  end
end
