require 'menu'

describe Menu do
  let(:menu) { Menu.new }

  it '#get_menu returns array of hashes' do
    menu.parse_file
    expect(menu.menu).to eq [{ name: 'item1', cost: 1.0 },
    { name: 'item2', cost: 2.0 },
    { name: 'item3', cost: 3.0 }]
  end
end
