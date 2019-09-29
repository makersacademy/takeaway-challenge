require 'order'

describe Order do
  subject(:order) { described_class.new }

  describe '#choose' do
    it 'responds to method' do
      expect(order).to respond_to(:choose)
    end

    it 'stores items in current order' do
      order.choose("pizza", 1)
      expect(order.current_order).to include(:pizza => 1)
    end

    it 'stores multiple items ordered' do
      order.choose("pizza", 1)
      order.choose("curry", 2)
      expect(order.current_order).to include(:pizza => 1, :curry => 2)
    end
  end
end
