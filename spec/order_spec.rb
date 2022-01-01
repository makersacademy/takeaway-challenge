require 'order'

describe Order do
  
  let(:order) { Order.new }
  let(:pizza) { double(name: 'pizza', price: 7) }
  let(:pasta) { double(name: 'pasta', price: 15)}

  it 'has an empty order_list when instantiated' do
    expect(order).to have_attributes(order_list: [])
  end

  it 'adds a dish to order_list' do
    order.add(pizza, 2)
    order.add(pasta)
    expect(order.order_list).to include({pizza => 2}, {pasta => 1})
  end
end