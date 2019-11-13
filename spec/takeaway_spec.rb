require 'takeaway'

describe Takeaway do
  it "has a list of dishes with prices" do
    expect(takeaway.display_menu).to eq("menu")
  end
end
