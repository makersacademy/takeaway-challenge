require 'menu'

describe Menu do

  it 'can add a dish to the menu' do
    menu = Menu.new
    dish = double(dish)
    menu.add_dish(dish)
    expect(menu.food_holder).to include dish
  end

  it 'can print the contents of the menu' do
    menu = Menu.new
    dish = double(dish, name: "Pizza", price: 5)
    menu.add_dish(dish)
    expect(menu.print_menu).to eq "Pizza -- $5"
  end

end
