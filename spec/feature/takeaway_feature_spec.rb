require 'menu'
require 'capybara/rspec'

feature 'Customers can see a list of dishes with prices' do
  scenario 'Customer asks for a list' do
    menu = Menu.new
    expect(menu.list).to eq(Burger: 5, Pizza: 10, Coke: 1)
  end

  scenario 'Customer orders an item from the list' do
    menu = Menu.new
    menu.order(:Burger)
    expect(menu.customer_order).to eq(Burger: 5)
  end

  scenario 'Customer orders multiple items from the list' do
    menu = Menu.new
    menu.order(:Burger, :Coke)
    expect(menu.customer_order).to eq(Burger: 5, Coke: 1)
  end

  scenario 'Customer orders item not on the menu' do
    menu = Menu.new
    expect do
      menu.order(:Lobster)
    end.to raise_error 'Sorry, that item isn\'t on our menu'
  end
end

# Add pound symbols to prices, expand menu, serve up
# in a nice format.

# Consider splitting menu to take ordering functions away
# Add error for when items asked for aren't in the menu