require "order"
require "menu"

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double("Menu") }

  let(:dishes) do
    {
      dumplings: 3,
      soup: 1
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:dumplings).and_return(true)
    allow(menu).to receive(:has_dish?).with(:soup).and_return(true)

    allow(menu).to receive(:price).with(:dumplings).and_return(5.00)
    allow(menu).to receive(:price).with(:soup).and_return(3.50)

  end

  describe '#add' do
    it 'selects several dishes' do
      order.add(:dumplings, 3)
      order.add(:soup, 1)
      expect(order.dishes).to eq(dishes)
    end

    it 'allows to add only the dishes that are on the menu' do
      allow(menu).to receive(:has_dish?).with(:fries).and_return(false)
      expect { order.add(:fries, 3) }.to raise_error "Fries not on the menu"
    end
  end

  describe '#total' do
    it 'sums up the order total' do
      order.add(:dumplings, 3)
      order.add(:soup, 1)
      total = 18.50
      expect(order.total).to eq(total)
    end
  end


end
