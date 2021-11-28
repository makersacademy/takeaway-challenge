require 'dish'

describe Dish do

  it "Knows its own name" do
    dish = Dish.new("Curry")
    dish_name = dish.names
    expect(dish_name).to eq("Curry")
  end

  it "Knows its own price" do
    dish = Dish.new
    expect(dish.price).to eq 5
  end

end
