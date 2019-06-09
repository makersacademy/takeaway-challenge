require 'takeaway'
require 'order'
require 'menu'

RSpec.describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms) }

# menu double and added method double for display
  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { double(:order, total: 15.50) }
  let(:sms) { double("SMS", deliver: nil) }
  let(:printed_menu) { "Chicken: £3.50" }

  let(:dishes) { { chicken: 2, fish: 1 } }

  before do
    allow(order).to receive(:add)
  end

  it "shows the menu with dishes and prices" do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

# introducing new order method therefore we need to consider an Order class. Creating double above.
  it "can order some number of several available dishes" do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it "knows the order total" do
    total = takeaway.place_order(dishes)
    expect(total).to eq(15.50)
  end

  it "sends an SMS when the order has been placed" do
    expect(sms).to receive(:deliver)
    takeaway.place_order(dishes)
  end
end
