require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new(menu, messenger, order) }
  let(:menu) { double :menu, read: { 'spring rolls' => 1.99, 'prawn toast' => 1.99,
     'egg fried rice' => 2.50, 'kung po chicken' => 4.50 }
  }
  let(:messenger) { double :messenger, confirm_order: nil }
  let(:order) { double :order, add: 1, summary: nil, check_total: true }

  describe '#read_menu' do
    it 'asks menu to return a price list' do
      expect(restaurant.read_menu).to eq menu.read
    end
  end

  describe '#order' do
    it 'stores a dish' do
      expect(restaurant.order('spring rolls')).to eq order.add('spring rolls', 1)
    end
  end

  describe '#order_summary' do
    it 'requests an itemised bill' do
      expect(restaurant.order_summary).to eq order.summary
    end
  end

  describe '#check_total' do
    it 'returns true if the total is correct' do
      expect(restaurant.check_total(10.98)).to eq order.check_total(10.98)
    end
  end

  describe '#confirm_order' do
    it 'allows messenger to send confirmation message' do
      expect(messenger).to receive(:confirm_order)
      restaurant.confirm_order
    end
  end
end
