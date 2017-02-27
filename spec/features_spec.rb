require "menu"
require "dishes"
require "total"
require "order"

describe "Feature Tests/User Stories" do
  subject(:total) {Total.new}

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it "displays a list of dishes with prices" do
    menu = Menu.new
    expect{menu.view_dishes}.to output("1. Tandoori Chicken: 3.50\n2. Lamb Madras: 4.00\n").to_stdout
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it "allows dishes to be selected from the menu" do
    order = Order.new
    expect{order.choose_dishes([1, 2], [2, 2], 15)}.to output("2 x Tandoori Chicken = 7.0\n2 x Lamb Madras = 8.0\nTotal = 15.0\nIs this correct? (y | n)\n").to_stdout
  end
  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it "raises an error if the user's total is incorrect", :focus do
    order = Order.new
    order.choose_dishes([1, 2], [2, 2], 999)
    expect{total.check}.to raise_error "Total incorrect. Please re-calculate."
  end

  it "raises an error if the user selects incorrectly" do
    order = Order.new
    expect{order.choose_dishes([3000, 2], [2, 2], 15)}.to raise_error "No such item on menu. Please re-order."
  end


end
