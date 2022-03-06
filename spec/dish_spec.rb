require 'dish'

describe Dish do
  dish = Dish.new("Tiramisu", 3.50)
  
  it "has a name" do
    expect(dish.name).to eq "Tiramisu"
  end

  it "has a price" do
    expect(dish.price).to eq 3.50
  end

  it "knows it is available by default" do
    expect(dish.available?).to be true
  end
  
  it "knows when it is not available" do
    dish.available = false
    expect(dish.available?).to be false
  end

  it "returns available when it is available" do
    dish.available = true
    expect(dish.availability).to eq ("available")
  end

  it "returns unavailable when it is unavailable" do
    dish.available = false
    expect(dish.availability).to eq ("unavailable")
  end
end
