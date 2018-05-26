require 'menu.rb'

describe Menu do
subject(:menu) { Menu.new }

  it 'can be initialized' do
    expect { menu }.not_to raise_error
  end

  it 'can return a list of items and prices' do
    expect(menu.view_menu).to include("Chicken Curry")
  end

end