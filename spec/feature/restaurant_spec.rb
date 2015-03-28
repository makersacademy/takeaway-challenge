require 'capybara/rspec'
require 'restaurant'

feature 'Restaurants lists its dishes' do

  scenario 'Customer can see dishes and prices' do
    customer = Customer.new(name: "Dan", phone: 888)
    big_mac = Dish.new(name: "Big Mac", price: 3.99)
    mcdonalds = Restaurant.new(big_mac)
    expect(customer.view_menu(mcdonalds)).to eq "1. Big Mac - £3.99"
  end
end