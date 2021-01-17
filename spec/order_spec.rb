require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double :menu }

  it 'adds a new item and quantity to the order list' do
    order.add("chicken", 3)
    expect(order.order_list).to eq(chicken: 3)
  end

  it 'raises an error if item is not on the menu' do
    expect { order.add("beef", 1) }.to raise_error "Item is not on the menu"
  end
end
