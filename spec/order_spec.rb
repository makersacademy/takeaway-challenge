require 'Order'

describe Order do
  let(:order) { described_class.new }

  it 'recieves and logs dishes and quantities' do
    selected = { steamed_bun: 4, seafood_ramen: 1 }
    order.add('steamed_bun', 4)
    order.add('seafood_ramen', 1)
    expect(order.selected).to eq(selected)
  end

  describe '#total' do
    it 'returns the total price' do
      order.add('steamed_bun', 4)
      order.add('seafood_ramen', 1)
      expect(order.total).to eq('Your order total is £28')
    end
  end
end
