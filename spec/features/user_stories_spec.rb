require 'menu'
require 'order'

describe 'User Stories' do
  let(:menu)  { Menu.new }
  let(:order) { Order.new }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so I can see the dishes on the menu' do
    expect { menu.dishes }.not_to raise_error
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'so I can select dishes to order' do
    dish = menu.dishes.first
    quantity = 1
    expect { order.select_dish(dish, quantity) }.not_to raise_error
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it 'so I can check the total price of my order' do
    dish_1 = double(:dish, :name => 'steamed pork dumpling', :price => 1.50)
    dish_2 = double(:dish, :name => 'spare ribs', :price => 4.50)
    dish_3 = double(:dish, :name => 'prawn crackers', :price => 1)
    order.select_dish(dish_1, 2)
    order.select_dish(dish_2, 1)
    order.select_dish(dish_3, 3)
    expect(order.total).to eq((dish_1.price * 2) + dish_2.price + (dish_3.price * 3))
  end
end
