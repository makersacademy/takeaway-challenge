require 'order'

describe Order do
  let (:order) { Order.new(1) }

  it 'shows a dish' do
    expect(order.dish).to eq "Egg Paneer Kathi Roll"
  end

  it 'shows a quantity' do
    multi_order = Order.new(1, 2)
    expect(multi_order.quantity).to eq 2
  end

end
