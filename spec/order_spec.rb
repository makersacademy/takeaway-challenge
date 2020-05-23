require 'order'

describe Order do
  it 'creates a new order' do
    expect(Order.new).to be_instance_of Order
  end
end
