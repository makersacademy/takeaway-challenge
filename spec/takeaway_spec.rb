require "takeaway"

describe Takeaway do
  before :each do
    @takeaway = Takeaway.new
  end

  it "allows the user to see a menu including items and prices" do
    @takeaway.menu { is_expected_to include(:item, :price) }
  end

  it "allows a user to select dishes to order from the menu" do
    @takeaway.order("Kebab")
    expect(@takeaway.cust_order).to include(item: "Kebab", price: 3.00)
  end
end
