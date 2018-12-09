require './lib/menu'

describe 'Menu' do

  let (:menu) { Menu.new }

  it 'can print a menu' do
    expect(menu.show_menu).to eq("Chicken Pie: £5 \nBeef Pie: £6 \nLiver Pie: £3 \nSteak and Kidney: £3 \nChicken and Leak: £6 \n")
  end
end
