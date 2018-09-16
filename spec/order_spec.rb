require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu_class) }
  let(:menu_class) { double :menu_class }
  let(:dishes) do
    {
     Pasta: 2,
     Chicken: 2
    }
  end

  before do
    allow(menu_class).to receive(:price).with(:Pasta).and_return(true)
    allow(menu_class).to receive(:price).with(:Chicken).and_return(true)
  end

  describe '#add' do
    it 'adds dishes to the order' do
      order.add(:Pasta, 2)
      order.add(:Chicken, 2)
      expect(order.dishes).to eq(dishes)
    end
  end

  describe '#total' do
    it 'calculates the total for the order' do
      allow(order).to receive(:add)
      order.add(:pasta, 2)
      order.add(:chicken, 2)
      total = 19.00
      expect(order.total).to eq(total)
    end
  end
end
