require "takeaway"

describe Takeaway do
  it "allows the user to see a menu including items and prices" do
    takeaway = Takeaway.new
    takeaway.menu {is_expected_to include(:item, :price)}
  end

  it "allows a user to select dishes to order from the menu" do
  
  end
end
