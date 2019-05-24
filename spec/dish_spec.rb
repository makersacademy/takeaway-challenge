require 'dish'

describe Dish do
  let(:dish) { Dish.new("Burger", 12.99)}

  it "has a name" do
    expect(dish.name).to eq("Burger")
  end

  it "has a price" do
    expect(dish.price).to eq(12.99)
  end
  it "consists of price and name" do
    expect(dish.item.values).to eq(["Burger", 12.99])
  end
end