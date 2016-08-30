require "takeaway"

describe TakeAway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }
  let(:menu) { double :menu, print: printed_menu }
  let(:printed_menu) { "Menu item: £3" }
  let(:order) { double :order }
  let(:dishes) { { wonton: 2.0, chowmein: 3.5 } }

  it "Shows menu items with prices" do
    expect(takeaway.show_menu).to eq printed_menu
  end

  it "can order number of several avalible dishes" do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

end
