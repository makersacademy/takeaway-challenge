require 'order'

describe Order do
  it 'creates an instance of Order' do
    order = Order.new
    expect(order).to be_instance_of(Order)
  end

  it 'shows list of dishes with prices' do
    order = Order.new
    expect(order.list).to eq("pizza, 1.00")
  end
end
