require 'rspec'
require 'order'

describe Order do
  let(:order) { described_class.new }
  let(:a2) { double :dish, description: 'Beef massaman', price: 380 }
  let(:b9) { double :dish, description: 'Chicken curry', price: 490 }

  it 'can be added to' do
    order.add_item(a2, 2)
    order.add_item(b9, 5)
    expect(order.items.count).to eq 7
  end

  it 'knows the total price of its items' do
    order.add_item(a2, 4)
    order.add_item(b9, 3)
    expect(order.total).to eq 2990
  end
end