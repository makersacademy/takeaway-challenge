require 'order'
describe Order do

  subject(:order) { described_class.new(menu) }
  let(:menu) { double(:menu) }

  before do
    allow(menu).to receive(:on_menu?).with(:pasta).and_return(true)
    allow(menu).to receive(:on_menu?).with(:pizza).and_return(true)
  end

  describe '#default' do
    it 'has an empty order' do
      expect(order.basket).to be_empty
    end
  end

  describe '#add' do
    it 'adds several dishes' do
      order.add(:pasta, 1)
      order.add(:pizza, 3)
      expect(order.basket).to eq({ pasta: 1, pizza: 3 })
    end

    it 'raises and error when dish is not avaiable' do
      allow(menu).to receive(:on_menu?).with(:coffee).and_return(false)
      expect { order.add(:coffee, 1) }.to raise_error "Coffee is not available"
    end
  end

  describe '#dish_total' do
    it 'calculates the total for each dish according to the quantity' do
      allow(menu).to receive(:price).with(:pasta).and_return(2.00)
      order.add(:pasta, 3)
      expect(order.dish_total).to eq [6.00]
    end
  end

  describe '#total' do
    it 'calculates the final total for the order' do
      allow(menu).to receive(:price).with(:pasta).and_return(2.00)
      allow(menu).to receive(:price).with(:pizza).and_return(5.49)
      order.add(:pizza, 2)
      order.add(:pasta, 3)
      expect(order.total).to eq 16.98
    end
  end
end
