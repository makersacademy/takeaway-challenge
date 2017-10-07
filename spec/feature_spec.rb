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
  it 'lets you empty your basket if you made a mistake' do
    eat.empty_basket
    expect(eat.basket).to be_empty
  end
  it 'lets you add multiples of the same dish to your basket' do
    eat.order('pie', 3)
    expect(eat.basket).to eq 'pie' => menu.dishes['pie']*3
  end
end
