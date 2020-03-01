require 'dishes'


describe Dishes do
  let(:dishes) {Dishes.new}
  let(:order_double){ double :order_double }
  it "initializes with a list a of dishes" do
    expect(dishes.menu).not_to be_empty
  end
  it "shows the user the menu items" do
    expect{dishes.see_menu}.to output(String).to_stdout
  end
  # before(:each) do

  it "creates an order" do
    dishes.create_order(order_double)
    expect(dishes.current_order).to eq order_double
  end
  it "user can add to order" do
    allow(order_double).to receive(:order) { [] }
    dishes.create_order(order_double)
    dishes.add_to_order("pizza", 2)
  end
end
