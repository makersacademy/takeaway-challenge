require 'order'

describe Order do
  let(:order) { described_class.new }

  it 'has is empty when created' do
    expect(order.new_order).to be_empty
  end

  it 'can add a dish to order' do
    order.add
    allow(order).to receive(:new_order)
  end 
end