require 'capybara/rspec'
require 'order'

feature 'A customer wants to order takeaway' do
  scenario 'Customer is able to view list of dishes from the menu' do
  	menu = Menu.new
  	expect(menu.print_menu).to be_a_kind_of(Hash)
  end

  scenario 'Customer is able to select multiple dishes from the menu' do
  	order = Order.new
  	order.add_dish 1, "Bottle of Water"
  	order.add_dish 2, "Carbonara"
  	expect(order.view_order).to include "Bottle of Water" && "Carbonara"
  end

  scenario 'Customer can view each dish alongside sum total of their order' do
    order = Order.new
    order.add_dish 2, "Bottle of Water"
    order.add_dish 3, "Ice cream"
    expect(checkout.order_price ).to eq 7.6
  end
end





#How does the menu know if the restaurant can't provide a particular dish?