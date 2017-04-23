require 'takeaway'
require 'menu'

describe Takeaway do
  it 'shows a menu' do
  	takeaway = Takeaway.new
  	expect(takeaway.show_menu).to eq(Menu::MENU)
  end
end