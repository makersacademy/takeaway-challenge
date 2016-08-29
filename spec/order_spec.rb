require 'order'

describe Order do

  subject(:order) { described_class.new }

  before(:each) do
    order.add_dish('Hedgeree', 1)
  end

  describe '#add_dish' do
    it 'adds the dish to the basket' do
      expect(order.basket).to(have_key('Hedgeree'))
    end

    it 'adds correct number of dishes to basket' do
      order.add_dish('Hedgeree', 2)
      expect(order.basket['Hedgeree']).to eq 3
    end
  end

  describe '#total' do
    it 'sums all items in basket' do
      order.add_dish('Hedgeree', 1)
      expect(order.total).to eq 15.3
    end
  end

  describe '#summary' do
    it 'provides a summary of current order' do
      expect(STDOUT).to receive(:puts).with('Hedgeree x 1 = £7.65')
      expect(STDOUT).to receive(:puts).with('Total = £7.65')
      order.summary
    end
  end

end
