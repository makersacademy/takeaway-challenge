require 'order'

describe Order do
  let(:menu) { double :menu }
  subject(:order) { described_class.new menu }

  before(:each) do
    allow(menu).to receive(:contains?).and_return(true)
    allow(menu).to receive(:price).and_return(7)
  end

  describe '#add' do
    it 'adds items to basket with quantity' do
      message = '1x pizza(s) added to your basket.'
      expect(order).to receive(:add).and_return(message)
      order.add(:pizza)
    end

    it 'does not add unavailable dish' do
      allow(menu).to receive(:contains?).and_return(false)
      message = 'lobster not on the menu'
      expect(order.add(:lobster)).to  eq message
    end
  end

  before(:each) { order.add(:pizza, 2) }

  describe '#show_basket' do
    it 'shows items in the basket' do
      expect(order.show_basket).to eq 'pizza x2 = 14'
    end
  end

  describe '#remove' do
    it 'removes item from basket' do
      message = '2x pizza(s) removed from your basket.'
      expect(order.remove(:pizza, 2)).to eq message
    end

    it 'does not remove unexistent dish' do
      message = 'lobster is not on your basket.'
      expect(order.remove(:lobster)).to eq message
    end
  end

  describe '#total' do
    it 'shows the sum of items in the basket' do
      expect(order.total).to eq 14
    end
  end

  describe '#complete_order' do
    it 'checks payment' do
      expect(order.complete_order(14)).to be true
    end
  end
end
