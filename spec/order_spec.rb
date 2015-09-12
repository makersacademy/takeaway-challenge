require './lib/order.rb'

describe Order do

  let(:order) {Order.new}

  it 'responds to add_item with 2 arguments' do
    expect(order).to respond_to(:add_item).with(2).arguments
  end

  it 'adds items to order_contents' do
    order.add_item('pepperoni pizza', 1)
    expect(order.contents).to include('pepperoni pizza', 1)
  end
end
