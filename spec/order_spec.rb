require 'order'

describe Order do
  let(:test_order) { { lobster: 1, nachos: 2 } }
  let(:test_list_data) { { burger: 15, lobster: 19, nachos: 5 } }
  let(:test_list) { double 'test_list', data: test_list_data }
  let(:test_total) { 29 }
  subject(:order) { described_class.new }

  describe '#make' do
    it 'expected to place new orders' do
      expect { order.place({ list: test_list, order: test_order, total: test_total }) }.not_to raise_error
    end
  end

  describe '#total' do
    it 'expected to calculate order total' do
      order.place({ list: test_list, order: test_order, total: test_total })
      expect(order.total).to eq test_total
    end
  end
end
