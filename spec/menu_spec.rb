require 'menu'

describe Menu do
  let(:menu_object) { Menu.new("Menu 1") }
  let(:menu_list) { [] }
  let(:dish) { double :dish, name: "Chicken Stew", price: 4.50}

  it 'has a list of dishes with prices' do
    expect(menu_object.show_menu).to eq(menu_list)
  end

  it 'should have a name' do
    expect(menu_object.name).to eq("Menu 1")
  end

  it 'can add dishes to a menu' do
    menu_object.add_to_menu(dish)
    expect(menu_object.menu.count).to eq(1)
  end

  it 'can remove a dish from the menu' do
    menu_object.add_to_menu(dish)
    menu_object.remove_from_menu(dish)
    expect(menu_object.menu.count).to eq(0)
  end




end
