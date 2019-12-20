require 'order'

describe Order do
  it 'can see items from Menu class' do
    menu = double :menu
    menu_class = double :menu_class, new: menu
    allow(menu).to receive(:list).and_return("item - £1.50")
    order = Order.new(menu_class)
    expect(order.see_menu).to eq("item - £1.50")
  end

  it 'allows user to select dishes' do
    menu = double :menu
    menu_class = double :menu_class, new: menu
    allow(menu).to receive(:get_price).with(:juice).and_return(1)
    allow(menu).to receive(:list).and_return("juice - £1.00")
    order = Order.new(menu_class)
    order.choose_item(:juice)
    expect(order.choice).to include(:juice => 1)
  end

  it 'calculates total cost of selected dishes' do
    menu = double :menu
    menu_class = double :menu_class, new: menu
    allow(menu).to receive(:get_price).with(:juice).and_return(1)
    allow(menu).to receive(:list).and_return("juice - £1.00")
    order = Order.new(menu_class)
    order.choose_item(:juice)
    expect(order.total_price).to eq 1
  end

  it 'prints receipt of order' do
    menu = double :menu
    menu_class = double :menu_class, new: menu
    allow(menu).to receive(:get_price).with(:juice).and_return(1)
    allow(menu).to receive(:list).and_return("juice - £1.00")
    order = Order.new(menu_class)
    order.choose_item(:juice)
    expect { order.print_receipt }.to output("juice - £1.00\nTotal to pay: £1.00").to_stdout
  end
end
