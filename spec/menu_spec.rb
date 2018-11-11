require 'menu'

describe Menu do
  let(:menu) { Menu.new }
  let(:menu_list) { Menu.new.menu }
  let(:menu_selection) { { large_chips: 1.99, medium_chips: 1.49, small_chips: 0.99 } }

  it 'can create a new menu' do
    expect(menu).to be_instance_of(Menu)
  end

  it 'includes dishes and prices when #initialize is called' do
    expect(menu.menu).to include({ large_chips: 1.99, medium_chips: 1.49, small_chips: 0.99 })
  end

  it 'can add menu items' do
    menu.add_dish("Wings", 2.99)
    expect(menu.menu).to include(Wings: 2.99)
  end

  it 'can remove a dish' do
    menu.remove_dish("medium_chips")
    expect(menu.menu).not_to include(medium_chips: 1.49)
  end

  it 'can #display menu to user' do
    expect(menu.display).to eq menu_selection
  end

end
