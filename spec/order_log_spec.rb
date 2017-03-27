require 'order_log'

describe OrderLog do

  subject(:order_log) { described_class.new }
  let(:order) { double :order }

  describe '#record_order' do
    it 'stores orders in a previous_orders array' do
      order_log.record_order(order)
      expect(order_log.previous_orders).to include order
    end
  end

end
