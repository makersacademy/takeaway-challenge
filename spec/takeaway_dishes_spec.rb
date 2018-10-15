require 'takeaway_dishes'

describe Dishes do

  subject { Dishes.new("Chicken Burger", 5) }

  it "returs name of dish" do
      expect(subject.name).to eq "Chicken Burger"
    end

  it "returns the price of the dish" do
    expect(subject.price).to eq 5
  end


end
