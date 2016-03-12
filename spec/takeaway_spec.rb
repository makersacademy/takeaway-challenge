require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }
  let(:order) { double(:order)}
  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "Pizza: £12.50" }

  let(:dishes) { {chicken: 2, fish: 1} }

  it "shows menu with dishes and prices" do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it "select some number of several available dishes" do
    expect(order).to receive(:add).twice
    expect(takeaway.place_order(dishes))

  end
end
