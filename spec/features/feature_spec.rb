require 'customer'
require 'restaurant'

feature 'customer can order a takeaway' do
  let(:customer) { Customer.new }
  let(:restaurant) { Restaurant.new }

  scenario 'customer can check a menu with prices' do
    expect(customer.checks_menu(restaurant)).to eq restaurant.menu
  end


  scenario 'customer can select items off the menu' do
    customer.selects_item(restaurant,'Burger', 1)
    customer.selects_item(restaurant,'Chips', 1)
    expect(customer.selects_item).to eq 2
    # don't like this
  end
end