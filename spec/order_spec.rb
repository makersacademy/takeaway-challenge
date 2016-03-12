require 'order'

describe Order do
  let(:menu) { double :menu }
  subject(:order) { described_class.new menu }

  describe '#add' do
    it 'adds items to basket with quantity' do
      allow(menu).to receive(:contains?).and_return(true)
      order.add(:pizza, 2)
      expect(order.basket).to include pizza: 2
    end
  end

  describe '#total' do
    it 'shows the sum of items in basket' do
      allow(menu).to receive(:contains?).and_return(true)
      allow(menu).to receive(:price).and_return(7)
      order.add(:pizza, 2)
      expect(order.total).to eq 14
    end
  end

  describe '#complete_order' do
    it 'checks amount' do
      allow(menu).to receive(:contains?).and_return(true)
      allow(menu).to receive(:price).and_return(7)
      order.add(:pizza, 2)
      expect(order.complete_order(14)).to be true
    end
  end
end
