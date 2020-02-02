require 'order'

describe Order do
  let (:order) { Order.new(1) }

  it 'shows a dish' do
    expect(order.dish).to eq "Egg Paneer Kathi Roll"
  end

end
