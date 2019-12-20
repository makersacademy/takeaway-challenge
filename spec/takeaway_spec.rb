require 'takeaway'

describe Takeaway do
  it "creates an instance of Takeaway" do
    takeaway = Takeaway.new
    expect(takeaway).to be_a Takeaway
  end
end
