require 'menu'

describe 'Menu' do
  subject(:menu) { Menu.new }

  it 'should contain a list of items and their prices in the menu' do
    expect(menu.menu_items.length).to eq(3)
  end

  it 'should print a list of dishes with their respective prices' do
    expect(menu.display_items).to eq("Pizza : £10\nPasta : £7\nGarlic_bread : £4\n")
  end
end
