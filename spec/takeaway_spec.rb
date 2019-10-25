require "takeaway"

describe Takeaway do
  before :each do
    @takeaway = Takeaway.new
  end

  it "has a menu of items on creating instance" do
    expect(@takeaway.dishes).not_to be_empty
  end

  it "allows user to view the items on the menu" do
    expect { @takeaway.view_menu }.to output.to_stdout
  end

  it "allows a user to select dishes to order from the menu" do
    @takeaway.order("Kebab")
    p @takeaway.cust_order
    expect(@takeaway.cust_order.length).to be 1
  end
end
