require 'place_order'

describe PlaceOrder do
  it 'send text with time and order cost' do
    order = double :placeorder
    allow(order).to receive(:totalcost).and_return(10)
    expect(order.totalcost).to eq 10
  end
end
