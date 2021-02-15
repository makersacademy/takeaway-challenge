require 'takeaway'

describe Takeaway do

  it "shows a list of the dishes with prices" do
    expect(subject.list).to eq(1)
  end

  it "some of the menu can be selected" do
    expect(subject.select).to eq(1)
  end

end
