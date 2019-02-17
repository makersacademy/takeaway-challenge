require "order"
describe Order do
  it "We can make an order now" do
    order = Order.new("1,meat dish, 2, vegeterian dish,3")
  end
end
