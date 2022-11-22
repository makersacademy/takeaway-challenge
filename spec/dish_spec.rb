require 'dish'

RSpec.describe Dish do

  it "returns the name of the dish" do
    dish = Dish.new("Pizza", 8)
    expect(dish.name).to eq "Pizza"
  end

  it "returns the price of the dish" do
    dish = Dish.new("Pizza", 8)
    expect(dish.price).to eq 8
  end

end