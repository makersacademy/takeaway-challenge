require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it 'shows the menu with prices' do
    expect(menu.menu_list).to eq Menu::DISH_LIST
  end

end
