require "takeaway"
require "order"

describe Takeaway do

  subject(:takeaway) { described_class.new(menu, order) }

  let(:menu) { double(:menu) }
  let(:order) { instance_double("Order", total: 12) }
  let(:dishes) { {chicken: 5, kebab: 2} }

  it "Displays a menu of dishes and prices" do
    expect(takeaway.show_menu).to eq(menu)
  end

  it "Can order several dishes" do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  it "Knows the order total" do
    allow(order).to receive(:add)
    total = takeaway.place_order(dishes)
    expect(total).to eq(12)
  end

end
