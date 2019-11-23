require 'order'

RSpec.describe Order do
  let(:test_order) { Order.new }
  let(:item_1) { double(:pizza, name: :pepperoni_pizza, price: 8) }
  let(:item_2) { double(:pizza, name: :margherita_pizza, price: 6) }

  it 'contains dishes ordered by the customer' do
    test_order.add_item(item_1)
    test_order.add_item(item_2)

    expect(test_order.items).to eq [item_1, item_2]
  end
end
