require 'Order'

describe Order do
  
  let(:order){ Order.new(maximum_order: 10) }
  let(:cereal){ double :cereal}

  it 'should have a maximum order value' do
    expect(order.maximum_order).to eq 10
  end

  it 'should let you add cereal to your order' do
    order.add_cereal(cereal, 1)
    expect(order.orders).to include (cereal)
  end

  it 'knows how many items are in the order' do
    order.add_cereal(cereal, 2)
    expect(order.orders).to include {double :cereal=>2}
  end












end