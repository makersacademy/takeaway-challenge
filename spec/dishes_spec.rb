require 'dishes'

describe Dishes do

  before(:each) do
    @dishes = Dishes.new("fish", 3)
  end

  it "should be an instance of Dishes" do
    expect(@dishes).to be_instance_of(Dishes)
  end

  it "should return a new dish with its name, 'fish'" do
    expect(@dishes.name).to eql("fish")
  end

  it "should return a new dish with its price" do
    expect(@dishes.price).to eql(3.00)
  end

end
