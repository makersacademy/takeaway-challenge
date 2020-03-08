require "takeaway"

describe Takeaway do 
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print: printed_menu) }
  #order class
  let(:order) { instance_double("Order", total: 15.50) }
  #Printed menu class
  let(:printed_menu) { "Pizza: £3.50" }

  let(:dishes) { {Pizza: 2, Soda: 1} }

  it "shows the menu with the dishes and prices" do
    expect(takeaway.print_menu).to eq (printed_menu)
  end

  it "Can order some number of several dishes " do 
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end
  
  it "knows the order total" do
    allow(order).to receive(:add)
    total = takeaway.place_order(dishes)
    expect(total).to eq(15.50)
  end

end