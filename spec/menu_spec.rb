require './lib/menu'
require './lib/takeaway'

describe Menu do
  subject(:menu) { Menu.new }

  it 'will list menu items' do
    expect(menu.list_items).to include([:burger, 5], [:pizza, 10], [:fries, 2], [:salad, 3])
  end
end
