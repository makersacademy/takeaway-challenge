require 'order'

describe Order do
  let(:item1) { double :item1, price: 8 }
  let(:item2) { double :item2, price: 4 }
  let(:order_list) { [[item1, 1], [item2, 2]] }
  subject { described_class.new(order_list) }

  describe '#item_list' do
    it 'returns the items with quantity' do
      expect(subject.item_list).to eq order_list
    end
  end

  describe '#total' do
    it 'returns the total cost of the order' do
      expect(subject.total).to eq 16
    end
  end
end
