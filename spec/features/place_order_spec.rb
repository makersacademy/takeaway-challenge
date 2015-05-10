require 'menu'
require 'customer'
require 'restaurant'

feature 'A customer can place an order' do

  scenario 'A customer can view the menu' do
    menu = Menu.new
    restaurant = Restaurant.new(menu)
    customer = Customer.new("name")
    expect(customer.view_menu(restaurant)).to eq restaurant.menu
  end

  scenario 'A customer can choose items to order' do
    menu = Menu.new
    customer = Customer.new
    restaurant = Restaurant.new(menu)
    customer.view_menu(restaurant)
    expect(customer.choose_dishes("Lobster", "Ice Cream")).to eq ["Lobster", "Ice Cream"]
  end

  scenario 'A customer can choose any number of each dish' do
    menu = Menu.new
    customer = Customer.new
    restaurant = Restaurant.new(menu)
    customer.view_menu(restaurant)
    customer.choose_dishes("Lobster")
    expect(customer.choose_amount(2)).to eq ["Lobster", "Lobster"]
  end

  xscenario 'A customer can review order' do
    menu = Menu.new
    customer = Customer.new
    restaurant = Restaurant.new(menu)
    customer.view_menu(restaurant)
    customer.choose_dishes("Ice Cream", "Lobster")
    customer.choose_amount(2, 2)
    expect(customer.view_order(menu)).to eq([["Ice Cream", 100.00], ["Ice Cream", 100.00], ["Lobster", 30.00], ["Lobster", 30.00]])
  end

  xscenario 'A customer can view total price' do
    menu = Menu.new
    customer = Customer.new
    restaurant = Restaurant.new(menu)
    customer.view_menu(restaurant)
    customer.choose_dishes("Truffle", "Ice Cream", "Crab")
    customer.choose_amount(2, 3, 2)
    customer.view_order(menu)
    expect(customer.view_price).to eq 414
  end

  xscenario 'A customer can place an order and recieve a message confirming the order'
    menu = Menu.new
    customer = Customer.new
    restaurant = Restaurant.new(menu)
    customer.view_menu(restaurant)
    customer.choose_dishes("Truffle")
    customer.choose_amount("4")
    customer.place_order




end