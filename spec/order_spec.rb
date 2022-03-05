require 'order'

describe Order do
  subject(:order) { described_class.new }

  it 'can create an Order' do
    expect(order).to be_a_kind_of(Order)
  end

  it 'creates an empty array called order' do
    expect(order.order).to eq []
  end
end
