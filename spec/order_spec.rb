require "order"
#require "takeaway" not required after stub

describe Order do

let (:order){Order.new(:takeaway)}

  it "should respond to add item" do
    expect(order).to respond_to(:add_item)
  end

  it "should respond to a menu item request with an array" do
    takeaway = double("takeaway")
    expect(takeaway).to receive(:menu_item).with(:number).and_return(Array)
  # takeaway = Takeaway.new
  # takeaway.add_menu_items(menu)
    order.add_item(:number, takeaway)
  end

  it "should show the items that are in the order" do
    expect(order.order).to be_an(Array)
  end

  it "should respond to customer_input" do
    expect(order).to respond_to(:customer_input)
  end




end
