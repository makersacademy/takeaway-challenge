require 'customer'
require 'restaurant'

feature 'Customer wants to see' do
  scenario 'a list of all dish names' do
    customer = Customer.new
    restaurant = Restaurant.new
    expect(customer.see_all_dishes(restaurant)).to eq restaurant.dishes
  end
end