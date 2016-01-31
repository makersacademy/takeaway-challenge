require 'order'

describe Order do
  subject(:order)     { described_class.new(order_details, total) }
  let(:total)         { 19.5 }
  let(:order_details) { { chicken_ruby: 2, kingfisher: 1 } }

  describe '#total' do
    it 'returns the total cost for the order' do
      expect(order.total).to eq total
    end
  end

  describe '#summary' do
    it 'returns the order summary' do
      expect(order.summary).to eq order_details
    end
  end
end
