require 'takeaway'

describe Takeaway do

  it "returns a menu when requested" do
    expect(subject).to respond_to(:read_menu)
  end

  it "returns the full menu when requested" do
    expect(subject.menu.dishes.length).to eq 5
  end
end
