require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order ) }
  
  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) {double(:order) }
  let(:printed_menu) { "Feijoada: £6.50" }
  let(:dishes) { { feijoada: 1, coxinha: 2 } }

  it "shows the list of dishes and their prices" do
    expect(takeaway.print_menu).to eq(printed_menu)
  end
  it "allow to order a number of dishes" do 
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end
end
