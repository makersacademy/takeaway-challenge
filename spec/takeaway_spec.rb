require 'takeaway'

describe "#menu" do

  subject(:takeaway) { Takeaway.new }

  it "should return a list of dishes with prices" do

    expect { takeaway.menu }.to output("Big Mac: £3.19\nQuarter Pounder: £3.19\nMcChicken: £3.00\nCheeseburger: £0.99\nHamburger: £0.89\nFrench Fries: £1.09\n").to_stdout
  end

end
