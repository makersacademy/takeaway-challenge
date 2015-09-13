require 'menu'


describe 'Menu' do
  it 'lists menu items' do
    menu_hash = {'fish':5.0,
             'cake':2.99,
             'beef':7.0}
    expect(Menu.new.list).to eq menu_hash
  end

  it 'returns a selected menu item' do
    hash = {fish:5}
    expect(Menu.new.select_food('fish')).to eq hash
  end

end
