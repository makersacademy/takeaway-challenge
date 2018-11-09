require './lib/menu'

describe Menu do
  it 'will list menu items' do
    menu = Menu.new
    expect(menu).to respond_to(:list_items)
  end
end
