require 'dishes'

describe Dishes do
  
  it "has dishes" do
    expect(subject.dishes).not_to be_empty
  end
end
