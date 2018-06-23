require 'order'
describe Order do

  subject(:order) { described_class.new(menu) }
  let(:menu) { double(:menu) }

  describe '#default' do
    it 'has an empty order' do
      expect(order.basket).to be_empty
    end
  end

  describe '#add' do
    it 'adds several dishes' do
      allow(menu).to receive(:on_menu?).with(:pasta).and_return(true)
      allow(menu).to receive(:on_menu?).with(:pizza).and_return(true)
      order.add(:pasta, 1)
      order.add(:pizza, 3)
      expect(order.basket).to eq({ pasta: 1, pizza: 3 })
    end

    it 'raises and error when dish is not avaiable' do
      allow(menu).to receive(:on_menu?).with(:coffee).and_return(false)
      expect { order.add(:coffee, 1) }.to raise_error "Coffee is not available"

    end
  end
end
