require 'restaurant'
require 'customer'
require 'message_sender'

feature 'As a customer I would like to' do
  let (:customer) {Customer.new{Restaurant.new}}
  scenario 'see a list of dishes with prices' do
    customer = Customer.new
    expect(customer.view_menu).to_not be_empty
  end

  scenario 'select some number of several dishes' do
    customer = Customer.new
    restaurant = Restaurant.new
    customer.select_dishes :Beef_BBQ, 1
    expect(customer.restaurant.order).to eq [:Beef_BBQ => 15]
  end

  scenario 'I would like to compare the total with the order I made' do
    customer = Customer.new
    customer.select_dishes :Beef_BBQ, 1
    customer.select_dishes :Vegetable, 2
    expect(customer.check_total_amount).to eq 47
  end

  scenario 'receive a text with confrimation of my order' do
    allow(customer).to receive(:order_confirmation).and_return(true)
    expect(customer.order_confirmation).to eq true
  end
end