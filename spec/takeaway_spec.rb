require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:order { instance_double("Order", total: 15.50) }
  let(:printed_menu) { "chicken: £ 3.50" }

  it "shows the menu with dishes and prices" do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it "can order some number of several available dishes" do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it "knows order total" do
    allow(order).to receive(:add)
    total = takeaway.place_order(dishes)
    expect(total).to eq(15.50)
  end

end
