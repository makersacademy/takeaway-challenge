require "Takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }


  let(:menu) { double:menu, print: printed_menu }
  let(:order) { double:order }
  let(:printed_menu) { "chicken balls: £3:50" }

  let(:dishes) { {chicken: 1, beef: 2} }

  it "Shows the menu with prices and the dishes" do
    expect(takeaway.print_menu).to eq (printed_menu)
  end
  it "can order a number of avalible dishes" do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end
end
