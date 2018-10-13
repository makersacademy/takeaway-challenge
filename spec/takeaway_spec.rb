require 'takeaway'

describe Takeaway do
  it "should display a list of dishes with prices" do
    expect(subject.menu).to eq "Quarter Chicken: £4\nHalf Chicken: £8\nWhole Chicken: £13\nChicken Wing: £1"
  end
end
