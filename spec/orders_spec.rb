require 'orders'

describe Order do

context '#initialize' do

    it ' is an instance of Order' do
      order_inst = Order.new
      expect(order_inst).to be_a Order
    end

    it ' has empty dish constant' do
      expect(Order::DISHES).to be_empty
    end

  end
end
