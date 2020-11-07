require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { instance_double("Order", total: 13.50) }
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

  it "knows the order total" do
    allow(order).to receive(:add)
    total = takeaway.place_order(dishes)
    expect(total).to eq(13.50)
  end

end
