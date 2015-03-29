require 'order'

describe Order do
  let(:order) { described_class.new }

  it 'has is empty when created' do
    expect(order.new_order).to be_empty
  end

  it 'can add a dish to order' do
    order.add
    allow(order).to receive(:new_order).and_return(burger: 10)
  end

  it 'can total prices' do
    order.add :burger
    order.add :pizza
    expect(order.total_price).to eq 24
  end
end