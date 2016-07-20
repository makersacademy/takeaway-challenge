require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print_menu: printed_menu) }
  let(:order) {double(:order)}

  let(:printed_menu) { "balti £5.00 , vindaloo £4.50" }
  let(:dishes) { {balti: 2, vindaloo: 2} }


  it "prints out a list of menu items and their prices" do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it "can order some number of available dishes" do
  expect(order).to receive(:add_to_order).twice
  takeaway.place_order(dishes)
  end
end
