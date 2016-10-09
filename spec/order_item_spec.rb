require 'order_item'

describe OrderItem do
  let(:dish) { double :dish }
  subject(:order) { described_class.new(dish) }

  context 'given an item without a quantity' do
    it 'contains an item' do
      expect(order.item).not_to be nil
    end
    it 'has a default quantity of 1' do
      expect(order.quantity).to eq 1
    end
  end
end
