# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
require 'menu'

feature 'a customer given a menu' do
  xscenario 'would like to see dishes with prices' do
    menu = Menu.new
    menu.add("Chicken", 7.8)
    menu.add("Corn", 8.4)
    expect(menu.show).to be eq "Chicken => 7.8, Corn => 8.4"
    # I got stuck literally here figuring out how to confirm showing menu
  end

  xscenario 'would like to select a number of dishes' do
    order = Order.new
    order.add("Chicken", 5, "Hamburger", 6)
  end
end
