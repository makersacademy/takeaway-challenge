require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms)}
  
  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { instance_double("Order", total: 8.80) }
  let(:sms) { instance_double("SMS", deliver: nil) }
  let(:printed_menu) { "Feijoada: £6.50" }
  let(:printed_menu) { "Coxinha: £1.15" }
  let(:dishes) { { feijoada: 1, coxinha: 2 } }

  before do 
    allow(order).to receive(:add)
  end

  it "shows the list of dishes and their prices" do
    expect(takeaway.print_menu).to eq(printed_menu)
  end
  it "allow to order a number of dishes" do 
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it "knows the order total" do
    total = takeaway.place_order(dishes)
    expect(total).to eq(8.80)
  end

  it "sends an SMS when the order has been placed" do
    expect(sms).to receive(:deliver)
    takeaway.place_order(dishes)
  end

end

