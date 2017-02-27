require 'takeaway'
require 'menu'
require 'message'

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

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'so customers can order, it allows user to select a quantity of dishes' do
    menu = Menu.new
    takeaway = Takeaway.new(menu)
    menu.add_dish("Burger Meal", 7)
    menu.add_dish("Lobster Meal", 10)
    expect{ takeaway.add_to_basket("Lobster Meal", 2) }.to change { takeaway.basket }.by [["Lobster Meal", 2, 20]]
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
  
end
