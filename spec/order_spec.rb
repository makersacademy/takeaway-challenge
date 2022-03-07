require 'order.rb'

describe Order do

  it 'should initialize with a menu' do 
    menu_double = double(:menu_double)
    allow(Menu).to(receive(:new).and_return(menu_double))
    order = Order.new
    expect(order.menu).to(eq(menu_double))
  end

  it 'should add a dish to the order after selecting from menu' do 
    menu_double = double(:menu_double, :dishes => { 'burger' => 5 })
    allow(Menu).to(receive(:new).and_return(menu_double))
    order = Order.new
    order.select('burger', 1)
    expect(order.current_order).to(eq({ 'burger' => 1 }))
  end

  it 'should show a list of dishes selected with prices and a total price' do 
    menu_double = double(:menu_double, :dishes => { 'burger' => 5 })
    allow(Menu).to(receive(:new).and_return(menu_double))
    order = Order.new
    order.select('burger', 2)
    expect(order.print_basket).to(eq("burger £5\nburger £5\nTotal £10"))
  end

end