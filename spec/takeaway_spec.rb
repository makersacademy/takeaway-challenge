require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { double(:order) }
  let(:printed_menu) { "menu list" }

  let(:dishes) { { chiken: 2, falafel: 1 } }

  # I would like to see a list of dishes with prices
  it "shows the menu with the dishes and prices" do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  # select some number of several available dishes
  it "can order a number of dishes" do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end
end
