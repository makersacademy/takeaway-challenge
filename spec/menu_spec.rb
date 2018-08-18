require 'menu'

describe Menu do

  it 'sets menu upon initialization' do
    expect(subject.menu_items).to eq Menu::MENU_SELECTIONS
  end

  it 'shows the menu' do
    expect(subject.view_menu).to eq Menu::MENU_SELECTIONS
  end
end
