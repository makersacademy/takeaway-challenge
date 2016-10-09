require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, display: printed_menu) }
  let(:order) { instance_double("Order", total: 30.00) }
  let(:printed_menu) { "Burger: £8.99" }

  let(:dishes) { { burger: 2, steak: 1 } }

  it "will show a menu with dishes and prices" do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it "can order some number of several available dishes" do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it "knows the order total" do
    allow(order).to receive(:add)
    total = takeaway.place_order(dishes)
    expect(total).to eq(30.00)
  end
end
