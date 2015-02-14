require 'order'

describe Order do

  it 'should start with no dishes' do
    order = Order.new
    expect(order.dishes).to eq []
  end

end