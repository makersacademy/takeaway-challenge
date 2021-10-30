require 'menu'

describe Menu do
  it 'prints see menu' do
    menu = Menu.new
    expect(menu.see_menu).to include {"Cod £6"}
  end
end