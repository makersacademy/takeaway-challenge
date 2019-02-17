require 'basket'

describe Basket do

  let ( :your_basket ) { Basket.new }

  it "initializes a new basket with an empty array" do
    expect(subject.basket).to eq([])

  end

  it "has an Add method" do
    expect(subject).to respond_to(:add).with(1).argument
  end

  it "has a Remove method" do
    expect(subject).to respond_to(:remove).with(1).argument
  end

  it "has a Total method" do
    expect(subject).to respond_to(:total)
  end

  it "can put something in the basket with add" do
    your_basket.add("Tasty treats")
    expect(your_basket.basket).to include("Tasty treats")
  end

end
