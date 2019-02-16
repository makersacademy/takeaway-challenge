require './lib/menu.rb'

describe Menu do
  let (:menu) { Menu.new }

  it 'should display the menu, showing each dish and its number' do
    allow(STDOUT).to receive(:puts)

    menu.view_menu

    expected_displayed_menu = 
      "1. Southern fried chicken - £9.00"
    
    expect(STDOUT).to have_received(:puts).with(expected_displayed_menu)
  end
end