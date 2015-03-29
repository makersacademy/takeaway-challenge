require 'order'

describe Order do
  let(:order) { described_class.new }

  it 'is empty when created' do
    expect(order.new_order).to be_empty
  end

  it 'can add a dish to order' do
    order.add
    allow(order).to receive(:new_order).and_return(burger: 10)
  end

  it 'can add up all prices' do
    order.total_price
    expect(order.total_price).to eq [:sum]
  end
end