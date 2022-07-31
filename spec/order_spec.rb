require 'order'

describe Order do
  it 'creates an instance of Order' do
    order = Order.new
    expect(order).to be_instance_of(Order)
  end

  it 'responds to list' do
    order = Order.new
    expect(order).to respond_to(:list)
  end



end
