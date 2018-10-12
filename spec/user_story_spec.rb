require "menu"

describe "User Stories" do
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  it "shows a list of items and prices" do
    menu = Menu.new
    expect { menu.view }.to output("Burger = £3\nHotdog = £2\n").to_stdout
  end
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
  it "remembers selected dishes" do
    menu = Menu.new
    order = Order.new
    menu.view
    order.choose("burger")
    expect(order.list).to include("Burger")
  end
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
  it "shows the total price of selected items" do
    menu = Menu.new
    order = Order.new
    menu.view
    order.choose("burger")
    expect(order.price).to eq(3)
  end
end
