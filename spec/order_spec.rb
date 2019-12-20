describe Order do
  it 'can see items from Menu class' do
    menu = double :menu
    menu_class = double :menu_class, new: menu
    allow(menu).to receive(list).and_return("item - £1.50")
    order = Order.new(menu_class)
    expect(order.see_menu).to eq("item - £1.50")
  end
end
