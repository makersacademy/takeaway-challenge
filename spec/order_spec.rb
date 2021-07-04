require "order"
require "dish"

describe Order do
  subject(:order) { Order.new(dish) }

  it "is the instance of class order" do
    expect(order).to be_instance_of Order
  end
end
