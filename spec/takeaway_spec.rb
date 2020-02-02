require "takeaway"

describe Takeaway do 
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print: printed_menu) }
  #order class
  let(:order) { double(:order) }
  #Printed menu class
  let(:printed_menu) { "Pizza: £8.99" }

  let(:dishes) { {Pizza: 2, Soda: 1} }

  it "shows the menu with the dishes and prices" do
    expect(takeaway.print_menu). to eq (printed_menu)
  end

  it "Can order some number of several dishes " do 
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end

end