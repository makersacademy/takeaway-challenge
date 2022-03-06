require 'order'
require 'dish'


describe Order do

  it { is_expected.to respond_to(:add)}

  it { is_expected.to respond_to(:print_order)}

  order = Order.new
  dish1 = Dish.new("Soup", 2.5)
  order_item = OrderItem.new(dish1, 2)

  it "knows that order status is pending by default" do
    expect(order.order_status).to eq "pending"
  end

  it "adds a dish to an order basket" do
    expect(order.add(order_item)).to eq [order_item]
  end

  it "raises an error if the dish is unavailable" do
    dish1.available=false
    expect{order.add(order_item)}.to raise_error("Sorry, dish unavailable")
  end

  it "prints order to standard output" do
    expect{order.print_order}.to output("2 x Soup\n").to_stdout
  end

  it "calculates cost of the order" do
    expect(order.calculate_total).to eq(5.0)
  end

  it "raises an error if order total does not match given bill" do
    expect{order.verify_total(10)}.to raise_error("Bill does not match the total sum of dishes ordered")
  end

  it "verifies order total when matches given bill" do
    expect(order.verify_total(5)).to be true
  end
  
  it "changes order status when order is placed" do
    order.place_order
    expect(order.order_status).to eq "accepted"
  end
end