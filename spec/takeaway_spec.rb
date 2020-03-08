require "takeaway"

describe Takeaway do 
  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms, config: {}) }

  let(:menu) { double(:menu, print: printed_menu) }
  #order class
  let(:order) { instance_double("Order", total: 15.50) }
  #Printed menu class
  let(:sms) { instance_double("SMS", deliver: nil) }
  let(:printed_menu) { "Pizza: £3.50" }

  let(:dishes) { {Pizza: 2, Soda: 1} }


  before do 
    allow(order).to receive(:add)
  end

  it "shows the menu with the dishes and prices" do
    expect(takeaway.print_menu).to eq (printed_menu)
  end

  it "Can order some number of several dishes " do 
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end
  
  it "knows the order total" do
    total = takeaway.place_order(dishes)
    expect(total).to eq(15.50)
  end

  it "Sends an SMS when the order has been places" do 
    expect(sms).to receive(:deliver)
    takeaway.place_order(dishes)
  end

end