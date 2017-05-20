require 'takeaway'
require 'menu'
require 'dish'

describe 'User Stories' do
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  it 'so that a customer can place an order he can read a list of dishes' do
    menu = Menu.new
    takeaway = Takeaway.new(menu)
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
    takeaway = Takeaway.new(menu)
    dish = Dish.new('wings', 7)
    dish2 = Dish.new('chicken', 2)
    menu.add_dish(dish)
    menu.add_dish(dish2)
    expect(takeaway.order 'wings', 2).to eq '2 x wings added to your cart'
  end
end
