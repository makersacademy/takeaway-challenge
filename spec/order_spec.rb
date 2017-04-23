require 'order'

describe Order do
  TEST_DISH = :pizza
  TEST_QTY = 2
  TEST_TOTAL = 6
  let(:order) { described_class.new(TEST_DISH, TEST_QTY, TEST_TOTAL) }
  describe '#initialize' do
    it 'saves the order as a hash' do
      expect(order.order_details[TEST_DISH]).to eq TEST_QTY
    end
  end
  describe '#calculated_total' do
    it 'calculates the total price ' do
      expect(order.calculated_total).to eq TEST_TOTAL
    end
  end
end
