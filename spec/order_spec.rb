require "order"

describe Order do
  subject(:order) { Order.new(menu) }

  it "is the instance of class order" do
    expect(order).to be_instance_of Order
  end
end
