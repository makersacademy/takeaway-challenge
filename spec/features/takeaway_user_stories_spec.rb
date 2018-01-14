require 'takeaway'

describe 'takeaway' do
    menu = Menu.new
    order = Order
    takeaway = Takeaway.new(menu, order)

  it 'prints menu to STDout' do
    menu.add_items_from_hash(Menu::CHINESE_MENU_ITEMS)
    expect { takeaway.print_menu }.to output("Prawn Toast, price £4.50\nFried rice, price £3.00\nBeef Chow mein, price £6.00\nSalt and Pepper King Prawn, price £7.00\n").to_stdout
  end
  it 'allows user to order some number of several available dishes' do
    menu.add_items_from_hash(Menu::INDIAN_MENU_ITEMS)
    takeaway.order_item("Pilau Rice",3)
    expect(takeaway.order_item("Tarka dal",3)).to eq [{:item=>"Pilau Rice", :quantity=>3, :cost => 3.0}, {:item=>"Tarka dal", :quantity=>3, :cost => 5.0}]
  end
end
