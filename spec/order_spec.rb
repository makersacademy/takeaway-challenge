require 'order'

describe Order do
  subject(:order) { described_class.new(:customer) }

  describe '#customer' do
    it 'orders have customers' do
      expect(order.customer).to eq(:customer)
    end
  end

  describe '#order' do
    it 'orders start off empty' do
      expect(order.order).to be_empty
    end
  end
end
