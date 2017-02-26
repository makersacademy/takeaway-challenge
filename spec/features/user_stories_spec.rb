require 'takeaway'
require 'menu'

describe 'User Stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so customers can order, it displays a list of prices' do
    menu = Menu.new
    takeaway = Takeaway.new(menu)
    menu.add_dish("Burger Meal", 7)
    menu.add_dish("Lobster Meal", 10)
    expect(takeaway.print_menu).to eq "Burger Meal: £7,Lobster Meal: £10"
  end
end
