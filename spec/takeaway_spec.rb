require "takeaway"

describe Takeaway do

subject(:takeaway) { described_class.new(menu: menu) }
let(:menu) { double(:menu, print: printed_menu) }
let(:printed_menu)  { "Chicken: £2.00" }

  it "displays menu with items and prices" do
    expect(takeaway.show_menu).to eq(printed_menu)
  end
end
