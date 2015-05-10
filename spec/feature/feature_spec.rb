require 'capybara/rspec'
require 'menu'

feature 'A customer wants to order takeaway' do
  scenario 'Customer is able to view list of dishes from the menu' do
  	menu = Menu.new
  	expect(menu.print_menu).to be_a_kind_of(Hash)
  end

  scenario 'Customer is able to select multiple dishes from the menu' do
  	order = Order.new
  	menu_dish = Menu.new
  	order.add_dish "Bottle of Water"
  	order.add_dish "Carbonara"
  	expect(order.view_order).to include "Bottle of Water" && "Carbonara"
  end
end





#How does the menu know if the restaurant can't provide a particular thing?