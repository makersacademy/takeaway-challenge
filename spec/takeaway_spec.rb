require 'takeaway'

describe Takeaway do
  let(:portuguese_menu) { double("Menu") }
  let(:order_instance) { double("Order") }

  it "allow menu_instance to call print_menu method" do
    takeaway = Takeaway.new(portuguese_menu, order_instance)
    allow(portuguese_menu).to receive(:print_menu)
    expect(portuguese_menu).to respond_to(:print_menu)
  end

  it "allow order_instance to call take_order method" do
    takeaway = Takeaway.new(portuguese_menu, order_instance)
    allow(order_instance).to receive(:take_order)
    takeaway.order(1)
    expect(order_instance).to respond_to(:take_order).with(1).argument
  end
end
