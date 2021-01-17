require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double :menu }

  it 'adds a new item and quantity to the order list' do
    order.add("chicken", 5)
    expect(order.order_list).to eq(chicken: 5)
  end

  it 'raises an error if item is not on the menu' do
    expect { order.add("beef", 1) }.to raise_error "Item is not on the menu"
  end

  it 'calculates the correct number of dishes' do
    order.add("chicken", 5)
    order.add("chicken", 1)
    order_list = { :chicken => 6 }
    expect(order.order_list).to eq(order_list)
  end

  it "calculates the total" do
    order.add("chicken", 5)
    order.add("potato", 2)
    verify = 29
    expect(order.verify).to eq(verify)
  end
end
