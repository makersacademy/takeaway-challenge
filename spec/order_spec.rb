require 'order'

describe Order do
  subject(:order) { Order.new double :menu, price_of: 9.99 }

  it 'adds a dish to its items' do
    order.add :burger
    expected_hash = { burger: 9.99 }
    expect(order.items).to eq(expected_hash)
  end

  xit 'can have two or more of the same item' do
    order.add :burger
    order.add :burger
    order.add :burger
    order.add :burger
    expected_hash = { burger: 9.99, burger2: 9.99 }
    expect(order.items).to eq(expected_hash)
  end

end
