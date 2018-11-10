require 'menu'
require 'order'

describe 'User Stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'allows me to see a list of dishes with prices' do
      dish_list = {
        'chicken korma' => 5.70,
        'chicken bhuna' => 6.70,
        'lamb rogan josh' => 6.50,
        'lamb madras' => 5.80,
        'king prawn dhansak' => 7.70,
        'plain rice' => 1.90,
        'pilau rice' => 2.00,
        'bombay aloo' => 3.25,
        'tarka daal' => 3.25,
        'plain naan' => 2.50,
        'garlic naan' => 2.75,
        'peshwari naan' => 3.00
      }
    menu = Menu.new(dish_list)
    expect(menu.list).to eq dish_list
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'allows me to select dishes' do
    dish_list = {
      'chicken korma' => 5.70,
      'chicken bhuna' => 6.70,
      'lamb rogan josh' => 6.50,
      'lamb madras' => 5.80,
      'king prawn dhansak' => 7.70,
      'plain rice' => 1.90,
      'pilau rice' => 2.00,
      'bombay aloo' => 3.25,
      'tarka daal' => 3.25,
      'plain naan' => 2.50,
      'garlic naan' => 2.75,
      'peshwari naan' => 3.00
    }
    menu = Menu.new(dish_list)
    order = Order.new(menu)
    order.add('chicken korma')
    order.add('bombay aloo')
    order.add('peshwari naan')
    expect{order.basket}.not_to raise_error
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  xit 'allows me to check the total of my basket' do
    dish_list = {
      'chicken korma' => 5.70,
      'chicken bhuna' => 6.70,
      'lamb rogan josh' => 6.50,
      'lamb madras' => 5.80,
      'king prawn dhansak' => 7.70,
      'plain rice' => 1.90,
      'pilau rice' => 2.00,
      'bombay aloo' => 3.25,
      'tarka daal' => 3.25,
      'plain naan' => 2.50,
      'garlic naan' => 2.75,
      'peshwari naan' => 3.00
    }
    menu = Menu.new(dish_list)
    order = Order.new(menu)
    order.add('chicken korma')
    order.add('bombay aloo')
    order.add('peshwari naan')
    expect{order.total}.not_to raise_error
  end
end
