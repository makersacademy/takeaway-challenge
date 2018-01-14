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
      expect(order.add_items("Prawn Toast", 2, 4.50)).to eq [{ item: "Prawn Toast", quantity: 2, cost: 4.5 }]
    end
    it 'stores items added to order in array of hashes' do
      order.add_items("Prawn Toast", 2, 4.50)
      expect(order.items).to eq [{ item: "Prawn Toast", quantity: 2, cost: 4.5 }]
    end
  end
  describe '#total' do
    it 'returns the total cost of the order' do
      order.add_items("Prawn Toast", 2, 4.50)
      expect(order.total).to eq 9
    end
    it 'returns the cost when multiple items added with different quantity' do
      order.add_items("Prawn Toast", 2, 4.50)
      order.add_items("Fried rice", 1, 3)
      order.add_items("Beef Chow mein", 6, 6.00)
      expect(order.total).to eq 48
    end
    it 'confirms no items added to order if order empty' do
      expect { order.total }.to raise_error "No items ordered yet!"
    end
  end
end
