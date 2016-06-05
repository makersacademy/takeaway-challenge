require "takeaway"

describe Takeaway do

subject(:takeaway) { described_class.new(menu: menu, order: order) }
let(:menu) { double(:menu, print: printed_menu) }
let(:order) { double(:order) }
let(:printed_menu)  { "Chicken: £2.00" }

let(:items) { { burger: 3, chicken: 2 } }

  it "displays menu with items and prices" do
    expect(takeaway.show_menu).to eq(printed_menu)
  end

  it "can order available dishes" do
    expect(order).to receive(:add).twice
    takeaway.place_order(items)
  end
end
