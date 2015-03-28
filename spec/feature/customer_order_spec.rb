require 'capybara/rspec'
require 'restaurant'
require 'customer'
require 'dish'

feature 'customer can place an order' do

  scenario 'Customer can send order & total, will error if incorrect' do
    customer = Customer.new(name: "Dan", phone: 888)
    big_mac = Dish.new(name: "Big Mac", price: 3.99)
    fries = Dish.new(name: "Salty French Fries", price: 1.99)
    cola = Dish.new(name: "Gallon o' Coke", price: 1.99)
    cafe = Restaurant.new(big_mac, fries, cola)
    order = { restaurant: cafe, items: [[1, 1], [2, 1], [3, 1]], total: 7.96 }
    expect { customer.order(order) }.to raise_error "wrong total"
  end
end