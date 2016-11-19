require "order"
#require "takeaway" not required after stub

describe Order do


  it "should respond to add item" do
    expect(subject).to respond_to(:add_item)
  end

  it "should respond to a menu item request with an array" do
    takeaway = double("takeaway")
    expect(takeaway).to receive(:menu_item).with(:number).and_return(Array)
  # takeaway = Takeaway.new
  # takeaway.add_menu_items(menu)
    subject.add_item(:number, takeaway)
  end

  it "should show the items that are in the order" do
    expect(subject.order).to be_an(Array)
  end

end
