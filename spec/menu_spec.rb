require "menu"
require "dishes"

describe Menu do

  takeaway_menu = Menu.new
  fried_rice = Dishes.new("Fried Rice", 2)
  takeaway_menu.load(fried_rice)
  it 'should show fried rice in the menu' do
    expect(takeaway_menu.menu).to include(fried_rice)
  end
end
