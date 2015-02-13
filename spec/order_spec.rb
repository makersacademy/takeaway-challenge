require 'order'

describe Order do

  it "can have a dish added to the current order" do
    dish = double :dish
    order = Order.new
    order.add_to_order(dish)
    expect(order.current_order).to include(dish)
  end

  it "has a quantity specified for each item in the order" do
    dish = double :dish
    order = Order.new
    order.add_to_order(dish, 2)
    expect(order.current_order).to include(dish => 2)
  end

end