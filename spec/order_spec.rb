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

  before do
    allow(menu).to receive(:has_dish?).with(:chicken).and_return(true)
    allow(menu).to receive(:has_dish?).with(:fish).and_return(true)
  end

  describe '#add' do
    it 'adds a dish to an order' do
      order.add(:chicken, 2)
      order.add(:fish, 1)
      expect(order.customer_order).to eq(customer_order)
    end

    it 'does not allow dishes that are not on the order to be added' do
      allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
      expect{ order.add(:beef, 1) }.to raise_error('Dish not available')
    end
  end
end
