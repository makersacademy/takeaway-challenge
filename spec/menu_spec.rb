require 'menu'
require 'support/shared_examples_for_food_list'

describe Menu do
  it_behaves_like FoodList

  it 'can get an item from the menu and return this' do
    menu_item_double_1 =
      double('menu_item_double_1', name: 'macaroni')
    menu_item_double_2 =
        double('menu_item_double_2', name: 'cheese')

    my_menu = Menu.new([menu_item_double_1, menu_item_double_2])

    expect(my_menu.get_item('cheese')).to eq(menu_item_double_2)
  end

  it 'doesnt remove an item from the menu when it gets it' do
    menu_item_double_1 =
      double('menu_item_double_1', name: 'macaroni')
    menu_item_double_2 =
        double('menu_item_double_2', name: 'cheese')

    my_menu = Menu.new([menu_item_double_1, menu_item_double_2])

    my_menu.get_item('cheese')

    expect(my_menu.items).to include(menu_item_double_2)
  end

  it 'returns nil if you try to get and item that isnt in the menu' do
    menu_item_double_1 =
      double('menu_item_double_1', name: 'macaroni')
    menu_item_double_2 =
        double('menu_item_double_2', name: 'cheese')

    my_menu = Menu.new([menu_item_double_1, menu_item_double_2])

    expect(my_menu.get_item('bacon')).to eq(nil)
  end
end
