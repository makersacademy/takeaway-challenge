require 'menu'

describe Menu do

  it 'sets menu upon initialization' do
    menu = Menu.new
    expect(menu.menu_items).to eq Menu::MENU_SELECTIONS
  end

  it 'returns the price of an item' do
    menu_items = { pie: 4.50 }
    expect(subject.price(:pie)).to eq 4.50
  end
end
