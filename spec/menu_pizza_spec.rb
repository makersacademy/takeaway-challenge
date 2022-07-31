require 'menu_pizza'

describe Menu do
  menu = Menu.new

  it 'checks array content' do
  expect(menu.dishes).to include(
    "cheese pizza" => a_value_between(1, 15) 
  )
  end
end