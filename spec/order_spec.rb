require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:test_order) { { lobster: 1, nachos: 2 } }

  describe '#make' do
    it 'expected to accept orders' do
      expect { order.make(test_order) }.not_to raise_error
    end
  end

  describe '#total' do
    before { order.make(test_order) }
    
    it 'expected to calculate order total' do
      expect(order.total).to eq 29
    end
  end
end
