require 'takeaway'


describe Takeaway do
  let(:takeaway) {Takeaway.new}
  let(:menu){double :menu, see_menu: printed_menu}
  let(:printed_menu){"menu"}
  let(:order_double){ double :order_double }
  it "initializes with a menu" do
    expect(takeaway.menu_var).not_to be_nil
  end
  it "shows the user the menu items" do
    expect(menu.see_menu).to eq(printed_menu)
  end
  # before(:each) do

  it "creates an order" do
    takeaway.create_order(order_double)
    expect(takeaway.current_order).to eq order_double
  end
  it "user can add to order" do
    allow(order_double).to receive(:order) { [] }
    takeaway.create_order(order_double)
    takeaway.add_to_order("pizza", 2)
  end
end
