require './lib/takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms, config: {}) }

  let(:menu) { double(:menu, show_menu: printed_menu) }
  let(:order) { instance_double("Order", total: 9.00) }
  let(:sms) { instance_double("SMS", send: nil) }
  let(:printed_menu) { "Burger: £5.00" }

  let(:dishes) { {chicken: 2, chips: 1.5} }

  before do
    allow(order).to receive(:add)
  end

  it "shows the menu with the dishes and prices" do
    expect(takeaway.print_menu).to eq printed_menu
  end

  it "can order some number of several available dishes" do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it "knows the order total" do
    total = takeaway.place_order(dishes)
    expect(total).to eq 9.00
  end

  it "sends a text message when an order is placed" do
    expect(sms).to receive :send
    takeaway.place_order(dishes)
  end

end
