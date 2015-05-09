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
    2.times { order.add_dish dish2 }
    expect(order.running_total).to eq 19.85
  end

end

feature 'Checking out an order' do

  let(:menu) { Menu.new }
  let(:order) { Order.new }

  scenario 'Checking the total cost of and printing receipt for final order' do
    dish1 = menu.dishes.select {|k, v| k == :'Red Curry'}
    dish2 = menu.dishes.select {|k, v| k == :'Green Curry'}
    order.add_dish dish1
    2.times { order.add_dish dish2 }
    checkout = Checkout.new(order)
    expect(checkout.final_total).to eq 19.85
    expect(checkout.print_receipt).to be_a_kind_of(Hash)
  end

end