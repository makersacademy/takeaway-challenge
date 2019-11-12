require './lib/order.rb'

describe Order do
  it 'should create an instance of the order class' do
    order = Order.new
    expect(order).to be_an_instance_of(Order)
  end
end
