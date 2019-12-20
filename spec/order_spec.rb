require 'order'

describe Order do

  it "creates a new order with the dish and price provided as arguments" do
    double_dish = double(:dish)
    double_price = double(:price)
    my_order = Order.new(double_dish, double_price)
    expect(my_order.ordered_items).to include(double_dish => double_price)
  end

end
