require 'menu'

describe Menu do
  let(:menu) { Menu.new }
  
  it '#get_menu returns array of hashes' do
    menu.get_menu
    expect(menu.menu).to eq [{ item: 'item1', cost: 1.0 },
    { item: 'item2', cost: 2.0 },
    { item: 'item3', cost: 3.0 }]
  end
end
