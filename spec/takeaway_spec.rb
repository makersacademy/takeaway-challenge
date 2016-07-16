require 'takeaway'

describe Takeaway do

  it "has a default empty order" do
    expect(subject.order).to be_empty
  end
  
end
