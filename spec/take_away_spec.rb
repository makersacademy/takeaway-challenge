require "take_away"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "Margarita: £5" }
  let(:order) { double(:order) }

  let(:dishes) { {margarita: 4, sandwich: 7} }

  it "shows the menus with prices" do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it "can order dishes" do
    expect(order).to receive(:add).twice
    takeaway.order_up(dishes)
  end
end