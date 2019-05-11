require 'menu'

describe Menu do

  it 'return menu' do
    expect(subject.menu_items).to eq(Menu::MENU_ITEMS)
  end

  it 'format the menu' do
    expect(subject.formatted_menu).to eq("
- Gunpowder green, £1.8
- Silver Needle white, £6
- Earl Grey, £2.75
- Ssuk-cha (mugwort), £5.2
- Ssanghwa-cha (medicinal), £4

")
  end

  it 'selects green tea based on input' do
    expect(subject.select_tea("green")).to eq("Gunpowder green" => 1.80)
  end

  it 'selects white tea based on input' do
    expect(subject.select_tea("white")).to eq("Silver Needle white" => 6)
  end

end
