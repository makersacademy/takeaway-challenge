require 'app'

describe App do 
  subject(:app) { described_class.new(menu_class, order_class) }
  let(:menu_class) {double(:menu_class, :new => menu)}
  let(:menu) { double(:menu, :items => {item: "Margherita", price: 10 })}
  let(:order_class) { double(:order_class, :new => order)}
  let(:order) {double(:order)}

  it 'asks the menu to display list' do 
    expect(menu).to receive(:display)
    app.display_menu
  end 

  it 'starts a new order' do 
    expect(app.new_order).to be(order)
  end

  it 'asks the menu to select the item and quantity' do 
    allow(order).to receive(:add_to_cart)
    expect(menu).to receive(:select)
    app.select_dish("Item", 2)
  end

  it 'tells the order to check total against user\'s total' do 
    app.new_order
    expect(order).to receive(:check_total)
    app.check_total(20)
  end 
end 