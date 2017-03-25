require 'order'

describe Order do
  subject(:order) { described_class.new(:menu) }
  let(:item) { double :item }
  let(:menu) { double :menu }

  describe '#initialize' do
    it 'has a menu' do
      expect(order.menu).to eq :menu
    end
  end

  describe '#add' do
    it 'returns item if it exists' do
      #I've tried to get this working with a double for hours but failed
      order = Order.new(menu)
      allow(menu).to receive(:does_not_contain?).with(:item).and_return(false)
      expect(order.add(:item)).to eq :item
    end
  end
end
