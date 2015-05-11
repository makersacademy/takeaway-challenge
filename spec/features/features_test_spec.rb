require 'menu'
require 'order'
require 'checkout'

feature 'Placing an order' do

  let(:menu) { Menu.new }
  let(:order) { Order.new }

  scenario 'Adding dishes to the order' do
    dish1 = menu.dishes.select {|k, v| k == :'Red Curry'}
    dish2 = menu.dishes.select {|k, v| k == :'Green Curry'}
    order.add_dish dish1
    order.add_dish dish2
    expect(order.dishes).to include dish1 && dish2
  end

  scenario 'Adding items to and checking running cost of order' do
    dish1 = menu.dishes.select {|k, v| k == :'Red Curry'}
    dish2 = menu.dishes.select {|k, v| k == :'Green Curry'}
    order.add_dish dish1
    order.add_dish dish2, 2
    expect(order.total order.dishes).to eq 19.85
    expect(order.display_order order.dishes).to eq "[\"Red Curry @ £5.95 x 1\", \"Green Curry @ £6.95 x 2\"]; TOTAL: £19.85"

  end

end

feature 'Checking out an order' do

  let(:menu) { Menu.new }
  let(:order) { Order.new }

  scenario 'Checking the total cost of and printing receipt for final order' do
    dish1 = menu.dishes.select {|k, v| k == :'Red Curry'}
    dish2 = menu.dishes.select {|k, v| k == :'Green Curry'}
    order.add_dish dish1
    order.add_dish dish2, 2
    checkout = Checkout.new(order)
    expect(checkout.total order.dishes).to eq 19.85
    expect(checkout.display_order order.dishes).to eq "[\"Red Curry @ £5.95 x 1\", \"Green Curry @ £6.95 x 2\"]; TOTAL: £19.85"
  end

end