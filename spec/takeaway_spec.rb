require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { double(:order, total: 15.60) }
  let(:printed_menu) { "Noodles: £4.00" }

  let(:dishes) { {noodles: 2, squid: 1} }

  it "shows menu with dishes and there prices" do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it "can order a number of several available dishes" do
    expect(order).to receive(:add).twice #found via rspec mocks
    takeaway.place_order(dishes)
  end
  
  it "knows the order total" do
    allow(order).to receive(:add)
    total = takeaway.place_order(dishes)
    expect(total).to eq(15.60)
  end
end