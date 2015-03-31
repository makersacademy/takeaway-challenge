require 'menu'

context 'Menu' do
  let(:menu) { Menu.new }

  it 'has dishes' do
    expect(menu.items.keys).not_to be nil
  end

  it 'dishes have prices' do
    expect(menu.items.values).not_to be nil
  end

  it 'can be displayed' do
    view_menu = "Cod £4\nSausage £3\nChips £2\n"
    expect(menu.view).to eq view_menu
  end

  it 'can have dishes added to it' do
    new_dish = { "Beans" => 2 }
    menu.add new_dish
    expect(menu.items.key?("Beans")).to be true
  end

  it 'can have dishes removed from it' do
    menu.remove "Cod"
    expect(menu.items.key?("Cod")).to be false
  end
end
