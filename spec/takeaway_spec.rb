require './lib/takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, show: printed_menu) }
  let(:order) { double(:order) }
  let(:printed_menu) { "Burger: £5.00" }

  let(:dishes) { {chicken: 2, chips: 1.5} }

  it "shows the menu with the dishes and prices" do
    expect(takeaway.print_menu).to eq printed_menu
  end

  it "can order some number of several available dishes" do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

end
