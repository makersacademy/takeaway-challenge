require 'menu'

describe 'User Stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'should print the menu with prices' do
    menu = Menu.new
    curry = Dish.new('Curry', 5)
    rice = Dish.new('Rice', 2)
    menu.add(curry)
    menu.add(rice)
    expect { menu.display }.to output("Menu List:\nCurry - £5\nRice - £2\n").to_stdout
  end
end
