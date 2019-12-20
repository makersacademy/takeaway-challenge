require 'order'

describe Order do
  it 'can see items from Menu class' do
    menu = double :menu
    menu_class = double :menu_class, new: menu
    allow(menu).to receive(:list).and_return("item - £1.50")
    order = Order.new(menu_class)
    expect(order.see_menu).to eq("item - £1.50")
  end

  it 'allows user to select several dishes' do
    menu = double :menu
    menu_class = double :menu_class, new: menu
    allow(menu).to receive(:get_price).with(:juice).and_return(1)
    expect(subject.choice).to include(:juice => 1)
  end
end
