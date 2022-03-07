require 'dish'

describe Dish do
  dish = Dish.new("Burger", 5)
  
  it "has a name" do
    expect(dish.name).to eq("Burger")
  end
  it "has a price" do
    expect(dish.price).to eq(5)
  end
end
