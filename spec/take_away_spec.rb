require "take_away"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) } 

  let(:menu) { double(:menu, print: printed_menu) }

  let(:order) { instance_double("Order", total: 15.00) }
  let(:sms) { instance_double("SMS", deliver: nil) }
   #create order class for place_order hold attribute 
  let(:printed_menu) { 'Pizza: £5.00' }

  let(:dishes) { {pizza: 1, falafel: 2} } #set dishes to be stubed in test

  it 'prints menu with dish and price' do

    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it 'can order some number of dishes' do
    expect(order).to receive(:add).twice #add in place_order method
    takeaway.place_order(dishes)
  end

  it 'knows the order total' do
    allow(order).to receive(:add)
    total = takeaway.place_order(dishes)
    expect(total).to eq(15.00)
  end

  it 'send message when order complete' do
    expect(sms).to receive(:deliver)
    take_away.place_order(dishes)
  end

end
