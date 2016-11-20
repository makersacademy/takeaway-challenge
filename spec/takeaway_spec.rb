require 'takeaway'
require 'menu'

describe Takeaway do
subject(:takeaway) {Takeaway.new}

describe "#print_menu" do
  it "should show the menu" do
    expect(takeaway.print_menu).to include({"Pizza" => 10})
  end
end

describe "#place order" do
  it "should allow a customer to place an order" do
    expect(takeaway.place_order("Pizza", 1, 10)).to eq("You have ordered 1 portion of Pizza at a total cost of £10")
  end
end



end
