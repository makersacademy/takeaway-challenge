require 'app'

describe App do 
  subject(:app) { described_class.new(menu_class, order_class, message_sender_class) }
  let(:menu_class) {double(:menu_class, :new => menu)}
  let(:menu) { double(:menu, :items => {item: "Margherita", price: 10 })}
  let(:order_class) { double(:order_class, :new => order)}
  let(:order) {double(:order)}
  let(:message_sender_class) {double(:message_sender_class, :new => message_sender)}
  let(:message_sender) {double(:message_sender)}

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

  it 'can tell twilio to send a message' do 
    expect(message_sender).to receive(:send_message)
    app.send_message
  end 

  it 'confirms an order' do 
    expect(app).to respond_to(:place_order).with(1).argument
  end 
  
  it 'raises an error if total is incorrect' do 
    app.new_order
    allow(order).to receive(:check_total).and_return(false)
    expect{app.place_order(20)}.to raise_error("Incorrect total")
  end 
end 