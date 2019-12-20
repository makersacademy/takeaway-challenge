require 'takeaway'

describe Menu do
  it 'can initialize a constant of menu' do
    menu = Menu.new
  end

  it 'holds a list of available items' do
    menu = Menu.new
    expect(menu.items).to include :chicken => 5.0
  end

  it 'displays a list of all available items' do
    menu = Menu.new
    expect(menu.display_menu).to include "nachos, £3.50"
  end
end
