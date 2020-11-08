require 'takeaway'

describe Takeaway do
  let(:portuguese_menu) { double("Menu") }
  let(:order_instance) { double("Order") }


  it "will present a menu with a list of dishes and prices" do
    takeaway = Takeaway.new(portuguese_menu, order_instance)
    allow(portuguese_menu).to receive(:dishes) { [{name: "Bacalhau com natas", price: 7.5}] }
    expect(takeaway.print_menu).to eq("1. Bacalhau com natas: 7.5\n")
  end

  it "allow order_instance to call take_order method" do
    takeaway = Takeaway.new(portuguese_menu, order_instance)
    allow(order_instance).to receive(:take_order)
    takeaway.order(1)
    expect(order_instance).to respond_to(:take_order).with(1).argument
  end
end
