require 'order'

RSpec.describe Order do
  let(:test_order) { Order.new }
  let(:item_1) { double(:pizza, name: :pepperoni_pizza, price: 8) }
  let(:item_2) { double(:pizza, name: :margherita_pizza, price: 6) }
  let(:item_3) { double(:pizza, name: :vegetarian_pizza, price: 6) }
  let(:item_4) { double(:pizza, name: :sausage_pizza, price: 8.5) }

  it 'contains dishes ordered by the customer' do
    test_order.add_item(item_1)
    test_order.add_item(item_1)
    test_order.add_item(item_2)

    expect(test_order.view).to eq "Pepperoni Pizza – Quantity: 2\nMargherita Pizza – Quantity: 1"
  end

  context 'when calculating prices' do
    it 'calculates the total price of items 1, 2 and 4 as £28.50' do
      test_order.add_item(item_4)
      test_order.add_item(item_2)
      test_order.add_item(item_2)
      test_order.add_item(item_1)

      expect(test_order.total).to be 28.5
    end

    it 'calculates the total price of items 2 and 3 as £12' do
      test_order.add_item(item_2)
      test_order.add_item(item_3)

      expect(test_order.total).to be 12
    end
  end
end
