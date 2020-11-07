require 'takeaway'
require 'menu'

describe Takeaway do
  let(:fake_menu) { { burger: 3, cheeseburger: 4, chips: 2 } }
  
  it 'responds to print_menu' do
    menu = Menu.new
    subject = Takeaway.new(menu)
    expect(subject.menu).to respond_to(:print_menu)
  end

  it 'prints the menu from Menu class' do
    menu = Menu.new
    subject = Takeaway.new(menu)
    expect(subject.print_menu).to eq fake_menu
  end
end
