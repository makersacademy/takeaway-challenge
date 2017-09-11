require 'order'

RSpec.describe Order do
  subject(:order) { described_class.new }
  let(:butter_chicken) { double :dish, price: 7.00 }
  let(:pad_thai) { double :dish, price: 8.00 }

  it 'add dish to your order' do
    order.add_dish(butter_chicken, 1)
    expect(order.orders).to include(butter_chicken)
  end

  it 'knows how many of each item are in the order' do
    order.add_dish(pad_thai, 2)
    order.add_dish(butter_chicken, 1)
    expect(order.item_count).to eq(3)
  end

  it 'can calculate the total of an order' do
    order.add_dish(pad_thai, 3)
    order.add_dish(butter_chicken, 1)
    expect(order.order_total).to eq(31.00)
  end

end
