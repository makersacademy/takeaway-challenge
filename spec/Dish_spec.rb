require "dish"

describe Dish do

  it "creates an instance of dish class" do
    dish = Dish.new(1, 2)
    expect(dish).to be_a(Dish)
  end

  it "adds price to a dish" do
    dish = instance_double(Dish, :price => 3.99)
    expect(dish.price).to eq(3.99)
  end

  it "adds name to a dish" do
    dish = instance_double(Dish, :name => "Chicken Noodles")
    expect(dish.name).to eq("Chicken Noodles")
  end
end
