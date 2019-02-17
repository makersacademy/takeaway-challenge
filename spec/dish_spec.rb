require 'dish'

describe Dish do
  it "Has a name after creation that is readable" do
    dish = Dish.new("dish",600)
    expect(dish.name).to eq "dish"
  end

  it "Has a price after creation that is readabble" do
    dish = Dish.new("dish", 600)
    expect(dish.price).to eq 600
  end
end
