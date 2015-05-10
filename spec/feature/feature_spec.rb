require 'capybara/rspec'
require 'menu'

feature 'A customer wants to order takeaway' do
  scenario 'Customer is able to view list of dishes from menu' do
  	menu = Menu.new
  	expect(menu.print_menu).to be_a_kind_of(Hash)
  end
end





#How does the menu know if it can't provide a particular thing?