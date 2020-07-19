require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }
  
  let(:menu) { double(:menu, menu_print: printed_menu) }
  let(:order) { double(:order, total: 14.50) }
  let(:printed_menu) { "Rice: £4.00" }
  let(:dishes) { { rice: 2, noodles: 1 } }
  
  it "knows the menu" do
    expect(takeaway.print_menu).to eq(printed_menu)
  end
  
  it "can order a selected number of dishes" do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end
  
  it "can display a reciept at the end of an order" do
    allow(order).to receive(:add).twice
    takeaway.place_order(dishes)
    expect(takeaway.reciept).to eq 14.50
  end
end
