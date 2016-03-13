require 'order'

describe Order do
  let(:menu) { double :menu }
  subject(:order) { described_class.new menu }

  describe '#show_basket' do
    it 'shows items in the basket' do
    end
  end

  describe '#add' do
    it 'adds items to basket with quantity' do
      allow(menu).to receive(:contains?).and_return(true)
      allow(menu).to receive(:price).and_return(7)
      message = '1x pizza(s) added to your basket.'
      expect(order).to receive(:add).and_return(message)
      order.add(:pizza)
    end
  end

  describe '#remove' do
    it 'removes item from basket' do
      allow(menu).to receive(:contains?).and_return(true)
      order.add(:pizza, 2)
      expect(order.remove(:pizza, 2)).to eq 0
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
