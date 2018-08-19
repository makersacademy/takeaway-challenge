require "menu"
require "dishes"
require "order"

describe "Feature tests - menu" do
  it "shows the menu on request" do
    menu = Menu.new
    menu.add_dish("Sweet and sour chicken", 8)
    menu.add_dish("Black bean pork", 10)
    display = { "Sweet and sour chicken" => 8,
    "Black bean pork" => 10 }
    expect(menu.show).to eq display
  end
end

describe "Feature tests - order" do
  it "adds some of the dishes to the order" do
    order_m = Order_manager.new
    request = "Sweet and sour chicken - 3, Black bean pork - 1, total - 4"
    order_m.new_order("John", request)
    expect(order_m.orders.length).to eq 1
    expect(order_m.orders["John"]).to be_a Order

  end

  it "shows the number of items in the order to the cust" do
    order_m = Order_manager.new
    request = "Sweet and sour chicken - 3, Black bean pork - 1, total - 4"
    order_m.new_order("John", request)
    expect(order_m.orders["John"].count).to eq 4
  end

  it "matches the total items logged with the customer total" do
    order_m = Order_manager.new
    request = "Sweet and sour chicken - 3, Black bean pork - 1, total - 4"
    order_m.new_order("John", request)
    expect(order_m.orders["John"].count).to eq order_m.orders["John"].total
  end

  # it "sends a message to confirm the order" do
  #   order_m = Order_manager.new
  #   request = "Sweet and sour chicken - 3, Black bean pork - 1, total - 4"
  #   order_m.new_order("John", request)
  #   expect(order_m.orders["John"].confirm).to eq true
  # end
  it "tracks all the orders in the order manager" do
    order_m = Order_manager.new
    name = "John"
    request = "Sweet and sour chicken - 3, Black bean pork - 1, total -4"
    order_m.new_order(name, request)
    name2 = "Dave"
    request2 = "Spicy beef - 2, Egg fried rice -1, total -3"
    order_m.new_order(name2, request2)
    expect(order_m.orders.length).to eq 2
    expect(order_m.orders["John"]).to be_a Order
    expect(order_m.orders["Dave"]).to be_a Order
  end

  it "receives texts and converts them to orders" do
    order_m = Order_manager.new
    order_m.pull_text_orders
    expect(order_m.orders.keys.length).to eq 1
    expect(order_m.orders.values[0]).to be_a Order
  end
end
