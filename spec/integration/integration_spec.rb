require 'takeaway'
require 'order_item'
require 'menu'

describe 'Takeaway integration' do

  it 'has menu with a list of dishes and prices' do
    menu = Menu.new
    takeaway = Takeaway.new(menu)
    expect(takeaway.view_menu.length).to eq 2
  end

end
