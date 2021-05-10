require './docs/order'

describe Order do
  
  it 'adds a dish from the menu to the ticket' do
    order = Order.new
    order.pickdish
    expect(order.ticket).to eq []
  end
  it 'adds the cost to the ticket' do
    order = Order.new
    order.pickdish
    expect(order.total(2)).to eq (2)
  end
end