require 'take_away'
require 'menu'

describe TakeAway do

subject(:take_away) { TakeAway.new }

it 'responds to showing of the menu' do
  expect(take_away).to respond_to(:show_menu)

end

it 'shows the menu' do
  menu = Menu.new
  available_menu = take_away.show_menu
  expect(available_menu).to eq available_menu
end




end
