require "takeaway"

describe Takeaway do

  subject(:takeaway) { described_class.new(menu, order) }

  let(:menu) { double(:menu) }
  let(:order) { double(:order) }
  let(:dishes) { {chicken: 5, kebab: 2} }

  it "Displays a menu of dishes and prices" do
    expect(takeaway.show_menu).to eq(menu)
  end

  it "Can order several dishes" do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

end
