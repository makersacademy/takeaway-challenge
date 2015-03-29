require 'menu'
require 'capybara/rspec'

feature 'Customers can see a list of dishes with prices' do
  scenario 'Customer asks for a list' do
    menu = Menu.new
    expect(menu.list).to eq(Burger: 5, Pizza: 10, Coke: 1)
  end

  scenario 'Customer orders an item from the list' do
  end
end

# Add £ symbols to prices, expand menu, serve up
# in a nice format.

# Consider splitting menu to take ordering functions away