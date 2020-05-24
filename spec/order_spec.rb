require 'order'

describe Order do

  # it 'contains an empty array to which you will add an order' do
  #   new_order = Order.new
  #   expect(new_order.instance_variable_get(:@order)).to eq([])
  # end


  it 'adds an item to the order' do
    expect(subject).to respond_to(:add_to_order).with(2).arguments
  end

end