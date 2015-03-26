require 'menu'

describe Menu do

  let(:menu) { Menu.new }
  let(:dish) {double :dish}

  it 'can add a dish to the menu' do
    menu.add_dish(dish)
    expect(menu.food_holder).to include dish
  end

  it 'can remove a dish from the menu' do
    menu.add_dish(dish)
    menu.remove_dish(dish)
    expect(menu.food_holder.count).to eq 0
  end

  it 'can print the contents of the menu' do
    dish = double(dish, name: "Pizza", price: 5)
    menu.add_dish(dish)
    expect(menu.print_menu).to eq "Pizza -- $5"
  end

  it 'prevents the same dishes being added to menu twice' do
    dish = double(dish, name: "Pizza", price:5)
    menu.add_dish(dish)
    expect{menu.add_dish(dish)}.to raise_error 'Dish already added'
  end

end
