require 'order'


describe Order do
  subject(:order) { described_class.new }
  let(:array) { ["food £4.32","other £5.34","more £2.34"] }

  describe '#sum_items' do
    it 'can sum items of an order' do
      expect(order.sum_items(array)).to eq '12.00'
    end
  end

  describe '#receipt' do
    it 'returns a receipt' do
      order.sum_items(array)
      expect(order.receipt).to respond_to(:split)
    end
  end
end