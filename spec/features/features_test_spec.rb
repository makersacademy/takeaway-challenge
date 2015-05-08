require 'menu'
require 'dish'
require 'order'

feature 'Creating the menu' do

  let(:menu) { Menu.new }
  let(:dish) { Dish.new 'red curry', 5.95 }
  let(:order) { Order.new }

  scenario 'Populate the menu with dishes and display' do
    menu.add_dish dish
    expect(menu.show_menu).to be_a_kind_of(Array)
  end

end

feature 'Placing an order' do

  let(:menu) { Menu.new }
  let(:dish) { Dish.new 'red curry', 5.95 }
  let(:order) { Order.new }

  scenario 'Adding a dish to the order' do
    menu.add_dish dish
    order.add_dish menu.dishes[0]
    expect(order.dishes).to include dish
  end

 scenario 'Checking the total cost of the order' do
    menu.add_dish dish
    menu.add_dish Dish.new 'Green curry', 6.95
    order.add_dish menu.dishes[0]
    order.add_dish menu.dishes[1]
    expect(order.total).to eq 12.9
  end

end