require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { double :menu}

  let(:customer_order) do
    {
      chicken: 2,
      fish: 1
    }
  end

  describe '#add' do
    it 'adds a dish to an order' do
      order.add(:chicken, 2)
      order.add(:fish, 1)
      expect(order.customer_order).to eq(customer_order)
    end
  end
end
