require 'order'

describe Order do
  test_order = Order.new(:test_dish, 1)
  describe '#initialize' do
    it 'saves the order as a hash' do

      expect(test_order.order_details[:test_dish]).to eq 1
    end
  end
  describe '#pricing' do
    it 'calculates the the total price ' do
      test_order.pricing
      expect(test_order.order_details[:test_dish]).to eq 2
    end
  end
end
