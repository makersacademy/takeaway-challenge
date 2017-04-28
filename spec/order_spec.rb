require 'order'

describe Order do
  TEST_TOTAL = 6
  TEST_ORDER = { pizza: 2 }
  let(:order) { described_class.new( TEST_ORDER, TEST_TOTAL) }
  describe '#calculated_total' do
    it 'calculates the total price ' do
      expect(order.calculated_total).to eq TEST_TOTAL
    end
  end
end
