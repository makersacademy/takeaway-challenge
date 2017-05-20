require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  it 'should display a menu item' do
    expect(menu.list_menu).to include "Cheeseburger" => 5
  end
  it 'should display a list of menu items' do
    expect(menu.list_menu).to include "BBQ Ranch Burger" => 8
  end
end
