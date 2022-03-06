require 'menu'

describe Menu do
  let(:menu_1) {Menu.new}

  let(:dish_1) { dish_1 = double('dish_1', name: 'Pizza', price: 8) }
  let(:dish_2) { dish_2 = double('dish_2', name: 'Pasta', price: 9) }

  it 'creates a new empty Menu array' do
    expect(menu_1.menu).to eq []
  end

  it 'adds a dish to the menu array' do
    menu_1.add_dish(dish_1)
    expect(menu_1.menu).to include(dish_1)
  end

  it 'shows items and prices in the menu' do
    menu_1.add_dish(dish_1)
    menu_1.add_dish(dish_2)
    expect { menu_1.view_menu }.to output("Pizza: £8\nPasta: £9\n").to_stdout
  end



end