require 'order'

RSpec.describe Order do
  let(:test_order) { Order.new }
  let(:item_1) { double(:pizza, name: :pepperoni_pizza, price: 8) }
  let(:item_2) { double(:pizza, name: :margherita_pizza, price: 6) }
  let(:item_3) { double(:pizza, name: :vegetarian_pizza, price: 6) }
  let(:item_4) { double(:pizza, name: :sausage_pizza, price: 8.5) }
  let(:listing_1) { { dish: item_1, available: 2 } }
  let(:listing_2) { { dish: item_2, available: 1 } }
  let(:listing_3) { { dish: item_3, available: 3 } }
  let(:listing_4) { { dish: item_4, available: 7 } }

  it 'contains dishes ordered by the customer' do
    test_order.add_item(listing_1)
    test_order.add_item(listing_2)

    expect(test_order.items_ordered).to eq [listing_1, listing_2]
  end

  it 'calculates the total price of the order' do
    test_order.add_item(listing_4)
    test_order.add_item(listing_2)
    test_order.add_item(listing_1)

    expect(test_order.total).to be 22.5
  end
end
