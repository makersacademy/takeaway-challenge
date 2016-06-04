require 'menu'

describe 'Feature' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so I decide to order, I want to see the menu' do
    menu = Menu.new
    expect(menu.show).to include('chips' => '£1', 'oreos' => '£3', 'milkshake' => '£2')
  end
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'so I can order a meal, I want to select from available dishes' do
    menu = Menu.new
    menu.select('chips')
    menu.select('milkshake', 3)
    expect{menu.select('cake')}.to raise_error 'unknown item inputted, please enter an item on the menu'
  end

end
