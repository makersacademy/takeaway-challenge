require 'order'

describe Order do

  # it 'contains an empty array to which you will add an order' do
  #   new_order = Order.new
  #   expect(new_order.instance_variable_get(:@order)).to eq([])
  # end

  it 'responds to #add_to_order with 2 arguments' do
    expect(subject).to respond_to(:add_to_order).with(2).arguments
  end

  it 'adds a dish and a quantity to an order' do
    order = Order.new
    order.add_to_order("chicken tikka", 2)
    expect(order.selection).to eq([{ dish: "chicken tikka", quantity: 2 }])
  end

end
