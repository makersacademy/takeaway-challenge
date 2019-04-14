require 'Order'

describe Order do
let(:order) { described_class.new }

  it 'recieves and logs dishes and quantities' do
    selected = { 'steamed_bun' => 4,'seafood_ramen' => 1 }
    order.add('steamed_bun', 4)
    order.add('seafood_ramen', 1)
    expect(order.selected).to eq(selected)
  end
end
