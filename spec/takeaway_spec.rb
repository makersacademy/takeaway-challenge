require "takeaway"

describe Order do
  it "can make a new instance of order" do
    expect(Order.new).to be_an_instance_of(Order)
  end

  it "can respond to order_dishes method" do
    order = Order.new
    expect(order).to respond_to(:order_dishes).with(2).argument
  end
end
