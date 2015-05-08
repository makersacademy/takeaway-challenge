require 'restaurant'
require 'customer'

feature 'As a customer' do
  scenario 'I would like to see a list of dishes with prices' do
    customer = Customer.new
    expect(customer.view_menu).to_not be_empty
  end
end