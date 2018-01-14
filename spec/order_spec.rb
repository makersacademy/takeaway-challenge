require 'order'

describe Order do
  subject(:order) { described_class.new }

  describe 'initialize' do
    it 'initializes with empty list of items' do
      expect(order.items).to be_empty
    end
  end

  describe '#add_items(item, quantity)' do
    it 'returns items added to order' do
      expect(order.add_items("Prawn Toast", 2, 4.50)).to eq [{item: "Prawn Toast", quantity: 2, cost: 4.5}]
    end
    it 'stores items added to order in array of hashes' do
      order.add_items("Prawn Toast", 2, 4.50)
      expect(order.items).to eq [{item: "Prawn Toast", quantity: 2, cost: 4.5}]
    end
  end
  describe '#total' do
    it 'returns the total cost of the order' do
      order.add_items("Prawn Toast", 2, 4.50)
      expect(order.total).to eq 9
    end
  end
end
