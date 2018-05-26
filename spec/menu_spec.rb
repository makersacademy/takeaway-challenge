require 'menu.rb'

describe Menu do
  subject(:menu) { described_class.new }

  it 'shows what is on the menu' do 
    expect(menu.view_menu).to include "1. Chicken Curry, £9.99"
    expect(menu.view_menu).to include "5. Pork Belly, £7.99"
    expect(menu.view_menu).to include "7. Mushroom Soup, £1.99"
  end
end