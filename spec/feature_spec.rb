require 'takeaway'
require 'menu'
require 'dish'
require 'order'

describe 'User Stories' do
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  it 'so that a customer can place an order he can read a list of dishes' do
    menu = Menu.new
    order = Order.new(menu)
    takeaway = Takeaway.new(menu, order)
    dish = Dish.new('wings', 7)
    dish2 = Dish.new('chicken', 2)
    menu.add_dish(dish)
    menu.add_dish(dish2)
    expect(takeaway.read_menu).to eq '1. wings, £7.00, 2. chicken, £2.00'
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'a customer can order an amount n of the desired dish' do
    menu = Menu.new
    order = Order.new(menu)
    takeaway = Takeaway.new(menu, order)
    dish = Dish.new('wings', 7)
    dish2 = Dish.new('chicken', 2)
    menu.add_dish(dish)
    menu.add_dish(dish2)
    expect(takeaway.add_to_order 'wings', 2).to eq '2 x wings added to your cart'
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it 'shows the user the ordered products with their price and the order total' do
    cart = "wings £7.00, wings £7.00, chicken £2.00"
    total = "Order Total: £16.00"
    menu = Menu.new
    order = Order.new(menu)
    takeaway = Takeaway.new(menu, order)
    dish = Dish.new('wings', 7)
    dish2 = Dish.new('chicken', 2)
    menu.add_dish(dish)
    menu.add_dish(dish2)
    takeaway.add_to_order 'wings', 2
    takeaway.add_to_order 'chicken', 4
    expect(takeaway.check_order).to eq cart
    expect(takeaway.check_total).to eq total
  end
end
