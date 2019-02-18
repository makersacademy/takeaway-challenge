require "order"
describe Order do
  it "We can make an order now" do
    order = Order.new("1,meat dish, 2, vegeterian dish,3")
  end

  describe "#check_order" do
    it "checks the order for the sum of meal numbers" do
      order = order = Order.new("1,meat dish, 2, vegeterian dish,4")
      expect {order.check_order}.to raise_error("Sum of dishes is not correct")
    end

    it "Does not raise an error when the sum of the order is correct." do
      order = order = Order.new("1,meat dish, 2, vegeterian dish,3")
      expect {order.check_order}.not_to raise_error("Sum of dishes is not correct")
    end
  end
end
