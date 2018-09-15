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
end
