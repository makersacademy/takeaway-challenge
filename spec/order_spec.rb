require 'order'

describe Order do

it 'creates an instance of Order' do
  order = Order.new
  expect(order).to be_an_instance_of(Order)
end



end
