require 'takeaway.rb'

describe TakeAway do

  it "instantiates a new takeaway class with a list of dishes" do
    expect(subject.dishes).to_not eq nil
  end

  it "instantiates a new takeaway class with a list of dishes" do
    expect(subject.dishes).to include "Wonton Soup"
  end

end
