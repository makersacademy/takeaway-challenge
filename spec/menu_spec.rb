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

  it 'allows user to select one dish' do
    menu = Menu.new
    menu.make_dish("sushi", 1)
    menu.add_dish
    menu.make_dish("laksa", 1)
    menu.add_dish
    menu.make_dish("pizza", 1)
    menu.add_dish
    expect(menu.dishes[0]).to include ({"sushi" => 1})
  end

  it 'allows user to select some number of dishes' do
    menu = Menu.new
    choice1 = menu.make_dish("sushi", 1)
    menu.add_dish
    choice2 = menu.make_dish("laksa", 1)
    menu.add_dish
    choice3 = menu.make_dish("pizza", 1)
    menu.add_dish
    menu.select_sushi
    menu.select_laksa
    expect(menu.selection).to include({"sushi" => 1}, {"laksa" => 1})
  end

  it 'gives customer the total' do
    menu = Menu.new
    choice1 = menu.make_dish("sushi", 1)
    menu.add_dish
    choice2 = menu.make_dish("laksa", 1)
    menu.add_dish
    choice3 = menu.make_dish("pizza", 1)
    menu.add_dish
    menu.select_sushi
    menu.select_laksa
    expect(menu.total).to eq 2
  end

  it 'checks total given to customer is same as sum cost of dishes selected' do
    menu = Menu.new
    choice1 = menu.make_dish("sushi", 1)
    menu.add_dish
    choice2 = menu.make_dish("laksa", 1)
    menu.add_dish
    choice3 = menu.make_dish("pizza", 1)
    menu.add_dish
    menu.select_sushi
    menu.select_laksa
    expect(menu.total).to eq (choice1["sushi"] + choice2["laksa"])
  end
end
