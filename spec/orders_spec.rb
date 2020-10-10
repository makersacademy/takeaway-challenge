require 'orders'

describe Order do

  it ' is an instance of Order' do
    order_inst = Order.new
    expect(order_inst).to be_a Order
  end
end
