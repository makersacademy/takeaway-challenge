require 'takeaway'
require 'menu'

describe Takeaway do
subject(:takeaway) {Takeaway.new}

describe "#print_menu" do
  it "should show the menu" do
    expect(takeaway.print_menu).to include({"Pizza" => 10})
  end
end

end
