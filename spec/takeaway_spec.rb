require 'takeaway'
require 'menu'

describe Takeaway do
subject(:takeaway) {Takeaway.new}

describe "#print_menu" do
  it "should show the menu" do
    expect(takeaway.print_menu).to include({"Pizza" => 10})
  end
end

  # it "should allow a customer to place an order" do
  #   expect(takeaway.place_order("Pizza")).to eq({ "Pizza" => 10})
  # end


end
