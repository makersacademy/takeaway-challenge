require 'order'

describe Order do
  it 'makes a list of order items' do
    order = described_class.new(steak: 2000, chips: 200)
    order.add(steak: 1, chips: 1)
    expect(order.list).to eq steak: 1, chips: 1
  end

  it 'creates a total cost' do
    menu = { steak: 2000, chips: 200 }
    order = described_class.new(steak: 2000, chips: 200)
    order.add(steak: 1, chips: 1)
    expect(order.total).to eq "22.00"
  end

  it 'returns message when order placed' do
    menu = { steak: 2000, chips: 200 }
    order = described_class.new(steak: 2000, chips: 200)
    order.add(steak: 1, chips: 1)
    expect(order.place(order.total)).to eq(
      'Thanks for your order, it should arrive in 30 mins.')
  end

  it 'raise error if total is not accurate' do
    menu = { steak: 2000, chips: 200 }
    order = described_class.new(steak: 2000, chips: 200)
    order.add(steak: 1, chips: 1)
    incorrect_total = 10
    expect { order.place(incorrect_total) }.to raise_error
  end
end
