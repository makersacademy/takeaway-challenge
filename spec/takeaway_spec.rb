require 'takeaway'

describe Takeaway do   
  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms, config: {}) } 

  let(:menu) { double(:menu, display_menu: displayed_menu) }
  let(:order) { instance_double("Order", total: 3.00) } 
  let(:sms) { instance_double("SMS", deliver: nil,) }
  let(:displayed_menu) { "pizza: £1.00" }
  let(:dishes) { { pizza: 1, pasta: 2 } }

  before do
    allow(order).to receive(:add)
  end

  it "returns the menu of dishes and prices" do
    expect(takeaway.display_menu).to eq(displayed_menu)
  end

  it "allows customer to order dishes from menu" do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)

  end

  it "calculates the order total" do
    total = takeaway.place_order(dishes)
    expect(total).to eq(3.00)
  end

  it "sends order confirmation and delivery time via SMS" do
    expect(sms).to receive(:deliver)
    takeaway.place_order(dishes)
  end

end
