describe Dish do

  it "Knows its own name" do
    dish = Dish.new
    expect(dish.name).to eq name
  end

  it "Knows its own price"  do
    dish = Dish.new
    expect(dish.price).to eq 5
  end

end