require "menu"

describe "User Stories" do
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  it "to check what to order show a list of items and prices" do
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
    order.choose("Burger")
    expect(order.list).to include("Burger")
  end
end
