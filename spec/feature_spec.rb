require 'takeaway'
require 'menu'

describe 'takeaway' do
  menu = Menu.new
  eat = TakeAway.new(menu)
  it 'lets you see the menu' do
    p eat.read_menu
    expect(eat.read_menu).to eq(menu.dishes)
  end
end
