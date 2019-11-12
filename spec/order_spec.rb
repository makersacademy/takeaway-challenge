require 'order'
describe Order do
  it 'creates instance' do
    order = Order.new
  expect(order).to be_instance_of(Order)
  end

  it 'responds to price_list' do
    order = Order.new
  expect(order).to respond_to(:price_list)
  end

  it 'shows the list of dishes'
    order = Order.new
  expect(order.price_list).to 
end
