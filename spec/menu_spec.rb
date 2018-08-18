require 'menu'

describe Menu do

  it 'sets menu upon initialization' do
    menu = Menu.new
    expect(menu.menu_items).to eq Menu::MENU_SELECTIONS
  end

end
