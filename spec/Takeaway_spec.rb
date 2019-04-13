require "Takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }


  let(:menu) { double:menu, print: printed_menu }
  let(:order) { instance_double("Order", total: 15.50) }
  let(:printed_menu) { "chicken balls: £3:50" }

  let(:dishes) { {chicken: 1, beef: 2} }

  it "Shows the menu with prices and the dishes" do
    expect(takeaway.print_menu).to eq (printed_menu)
  end

  it "can order a number of avalible dishes" do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

    it "knows the order total" do
      allow(order).to receive(:add)
    total = takeaway.place_order(dishes)
    expect(total).to eq(15.50)
  end
end
