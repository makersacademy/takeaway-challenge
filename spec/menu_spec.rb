require 'menu'
require 'dish'

describe Menu do

  it 'adds a new dish to dishes array and shows dishes with prices' do
    menu = Menu.new
    menu.make_dish("sushi", 1)
    menu.add_dish
    menu.make_dish("laksa", 1)
    menu.add_dish
    menu.make_dish("pizza", 1)
    menu.add_dish
    expect(menu.dishes).to include({"sushi" => 1}, {"laksa" => 1}, {"pizza" => 1})
  end








end
