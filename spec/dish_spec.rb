require 'dish'

describe Dish do
  before(:each) do
    @dish = Dish.new("Mapo Tofu", 5.00)
  end

  it "has a name" do
    expect(@dish.name).to eq("Mapo Tofu")
  end

  it "has a price" do
    expect(@dish.price).to eq(5.00)
  end
end