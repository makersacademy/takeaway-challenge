require 'order'

describe Order do
  let(:test_order) { { lobster: 1, nachos: 2 } }
  let(:test_list_data) { { burger: 15, lobster: 19, nachos: 5 } }
  let(:test_list) { double 'test_list', data: test_list_data }
  subject(:order) { described_class.new({ order: test_order, list: test_list }) }

  describe '#initialize' do
    it 'expected to create new orders' do
      expect { described_class.new({ order: test_order, list: test_list }) }.not_to raise_error
    end
  end

  describe '#total' do
    it 'expected to calculate order total' do
      expect(order.total).to eq 29
    end
  end
end
