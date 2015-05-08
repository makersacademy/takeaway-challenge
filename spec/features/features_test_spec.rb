require 'menu'
require 'order'

feature 'Placing an order' do

  let(:menu) { Menu.new }
  let(:order) { Order.new }

  scenario 'Adding dishes to the order' do
    dish1 = (menu.dishes.select { |dish| dish[:name] == 'Red curry' })[0] # UGLY CODE (without parentheses and index will return as array)
    dish2 = (menu.dishes.select { |dish| dish[:name] == 'Green curry' })[0]
    order.add_dish dish1
    order.add_dish dish2
    expect(order.dishes).to include dish1 && dish2
  end

  scenario 'Adding items to and checking running cost of order' do
    dish1 = (menu.dishes.select { |dish| dish[:name] == 'Red curry' })[0] # UGLY
    dish2 = (menu.dishes.select { |dish| dish[:name] == 'Green curry' })[0] # UGLY
    order.add_dish dish1
    order.add_dish dish2
    expect(order.running_total).to eq 12.9
  end

end