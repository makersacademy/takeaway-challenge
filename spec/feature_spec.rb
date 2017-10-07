require 'takeaway'
require 'menu'

describe 'takeaway' do
  menu = Menu.new
  eat = TakeAway.new(menu)
  it 'lets you see the menu' do
    expect(eat.read_menu).to eq(menu.dishes)
  end
  it 'lets you add a dish to your basket' do
    eat.order('sushi')
    expect(eat.basket).to eq 'sushi' => 5.99
  end
end
