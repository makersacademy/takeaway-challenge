require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { double(:order, total: 15.00)}
  let(:sms) { double(:sms, deliver: nil)}
  let(:printed_menu) { "Pizza: £12.50" }

  let(:dishes) { {chicken: 2, fish: 1} }

  it "shows menu with dishes and prices" do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it "select some number of several available dishes" do
    expect(order).to receive(:add).twice
    expect(takeaway.place_order(dishes))
  end

  it "it knows the order total" do
    allow(order).to receive(:add)
    total = takeaway.place_order(dishes)
    expect(total).to eq(15.00)
  end

  it "it sends a text msg when the order has been placed" do
    allow(order).to receive(:add)
    expect(sms).to receive(:deliver)
    takeaway.place_order(dishes)

  end

end
