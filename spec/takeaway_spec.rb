require 'takeaway'
  
describe Takeaway do

  it 'should be able to have a menu' do
    takeaway = Takeaway.new
    menu = double :menu
    takeaway.add_menu(menu)
    expect(takeaway.menu).to eq menu
  end

end