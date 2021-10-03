require "dish"

describe Dish do
  before do
    @dish = Dish.new("Pizza")
  end

  it "has a dish name" do
    expect(@dish.name).to eq("Pizza")
  end
end
