require 'takeaway'

describe 'takeaway' do
  it 'prints menu to STDout' do
    menu = Menu.new
    menu.add_items_from_hash(Menu::CHINESE_MENU_ITEMS)
    takeaway = Takeaway.new(menu)
    expect { takeaway.print_menu }.to output("Prawn Toast, price £4.50\nFried rice, price £3.00\nBeef Chow mein, price £6.00\nSalt and Pepper King Prawn, price £7.00\n").to_stdout
  end

end
