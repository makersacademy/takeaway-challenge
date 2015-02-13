require 'dish'

describe Dish do

  it "should have a name" do
    dish = Dish.new("Chicken Katsu Curry")
    expect(dish.name).to eq("Chicken Katsu Curry")
  end

  it "should have a price" do
    dish = Dish.new("Chicken Katsu Curry", 6)
    expect(dish.price).to eq(6)
  end

end