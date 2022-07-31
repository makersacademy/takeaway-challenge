require "dish"

describe Dish do
  before do
    @dish = Dish.new("Pizza", 8.00)
  end

  it "has a dish name" do
    expect(@dish.name).to eq("Pizza")
  end

  it "has a dish price" do
    expect(@dish.price).to eq(8.00)
  end
end
