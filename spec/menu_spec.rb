require 'menu'

describe Menu do

  it 'return menu' do
    expect(subject.menu_items).to eq(Menu::MENU_ITEMS)
  end

  it 'format the menu' do
    expect(subject.formatted_menu).to eq("
- Gunpowder green, £1.8
- Nepalese 'silver needle' white, £6
- Earl Grey, £2.75
- Ssuk-cha (korean mugwort), £5.2
- Ssanghwa-cha (korean medicinal), £4

")
  end

end
