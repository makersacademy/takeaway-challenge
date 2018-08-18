require "menu"
require "dishes"
require "order"

describe "Feature tests - menu" do
  it "shows the menu on request" do
    menu = Menu.new
    menu.add_dish("Sweet and sour chicken", 8)
    menu.add_dish("Black bean pork", 10)
    display = {"Sweet and sour chicken" => 8,
    "Black bean pork" => 10}
    expect(menu.show).to eq display
  end
end

describe "Feature tests - order" do
  it "adds some of the dishes to the order" do
    menu = Menu.new
    menu.add_dish("Sweet and sour chicken", 8)
    menu.add_dish("Black bean pork", 10)
    order = Order.new
    request = "Sweet and sour chicken - 3, Black bean pork - 1"
    out = {"sweet and sour chicken" => 3, "black bean pork" => 1}
    expect(order.add_dishes(request)).to eq out
  end

  it "shows the number of items in the order to the cust" do
    menu = Menu.new
    menu.add_dish("Sweet and sour chicken", 8)
    menu.add_dish("Black bean pork", 10)
    order = Order.new
    request = "Sweet and sour chicken - 3, Black bean pork - 1"
    order.add_dishes(request)
    expect(order.count).to eq 4
  end

  it "matches the total items logged with the customer total" do
    menu = Menu.new
    menu.add_dish("Sweet and sour chicken", 8)
    menu.add_dish("Black bean pork", 10)
    order = Order.new
    request = "Sweet and sour chicken - 3, Black bean pork - 1, total -4"
    order.add_dishes(request)
    expect(order.count).to eq order.total
  end
end
