require "takeaway.rb"

describe Takeaway do 
  it "shows menu" do
    expect(subject.dish_price).to eq @menu
  end

  it "selects dish" do
    expect(subject.select_dish("Small Chips")).to eq ["Small Chips"]
  end 
end 