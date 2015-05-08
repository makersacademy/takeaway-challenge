require 'order'

describe Order do
  it 'makes a list of order items' do
    order = described_class.new(steak: 2000, chips: 200)
    order.add(steak: 1, chips: 1)
    expect(order.list).to eq steak: 1, chips: 1
  end

  it 'raises error for non-menu items' do
    order = described_class.new(steak: 2000, chips: 200)
    expect { order.add(steak: 1, potato: 1) }.to raise_error
  end
end
