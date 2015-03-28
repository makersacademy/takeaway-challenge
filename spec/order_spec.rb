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
    allow(Time).to receive(:now) { Time.new(2015, 03, 28, 17, 30, 11) }
    expect(order.place(order.total)).to eq(
      'Thanks for your order, it should arrive before 18:30.')
  end

  it 'raise error if total is not accurate' do
    menu = { steak: 2000, chips: 200 }
    order = described_class.new(steak: 2000, chips: 200)
    order.add(steak: 1, chips: 1)
    incorrect_total = 10
    expect { order.place(incorrect_total) }.to raise_error
  end
end
