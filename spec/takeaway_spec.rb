require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { double(:order) }
  let(:printed_menu) { "Hotdog: £5.00" }

  let(:dishes) { {hotdog: 2, fries: 1 } }

  it "Instantiates a new class" do
    expect(takeaway).to be_a_kind_of Takeaway
  end

  it "shows the menu when called" do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it "can order some number of several available dishes" do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

end
