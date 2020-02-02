require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { double(:order, total: 15.50) }
  let(:printed_menu) { "Salad £3.50, Falafel £4.50" }
  let(:dishes) { {
    salad: 3.50,
    falafel: 4.50,
  } }
  
  # I would like to see a list of dishes with prices
  it "shows the menu with the dishes and prices" do
    
    expect(takeaway.print_menu).to eq(dishes)
  end

  # select some number of several available dishes
  it "can order a number of dishes" do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

  # check that the total I have been given
  # matches the sum of the various dishes in my order
  it "knows the order total" do
    allow(order).to receive(:add)
    total = takeaway.place_order(dishes)
    expect(total).to eq(15.50)
  end
end
