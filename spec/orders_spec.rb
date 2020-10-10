require 'orders'

describe Order do

context '#initialize' do

    it ' is an instance of Order' do
      order_inst = Order.new
      expect(order_inst).to be_a Order
    end

    it ' has dish constant with array of menu items' do
      expect(Order::DISHES).to_not be_empty
    end

  end
end
