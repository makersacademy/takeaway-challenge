require 'order'
describe Order do
  it 'creates instance' do
    order = Order.new
  expect(order).to be_instance_of(Order)
  end
end
