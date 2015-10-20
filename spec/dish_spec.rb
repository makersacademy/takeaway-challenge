require "./lib/dish"

describe Dish do

  subject { Dish.new("Burger", 8) }

  it "has a name" do
    expect(subject.name).to eq("Burger")
  end

  it "has a price" do
    expect(subject.price).to eq(8)
  end

  it "has equality" do
    expect(subject).to eq(Dish.new("Burger", 8))
  end

end