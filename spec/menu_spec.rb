require 'menu'
require 'dish'

describe Menu do

  it 'adds a new dish to dishes array' do
    menu = Menu.new
    sushi = Dish.new
    expect(menu.add_dish(sushi)).to eq [sushi]
  end

  it 'views the dishes in the dish array' do
    menu = Menu.new
    sushi = Dish.new
    menu.add_dish(sushi)
    expect((menu.view_dishes)).to eq [sushi]
  end


























end
