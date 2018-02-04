require "dish"

describe Dish do

  it 'Creates a new dish using SKU# including the correct name' do
    dish = Dish.new(1)
    expect(dish.name).to eql("Beef burger")
  end

  it 'Creates a new dish including a price' do
    dish = Dish.new(1)
    expect(dish.price).to eql(10)
  end

  it "Create a new dish with a custom quantity" do
    dish = Dish.new(1,3)
    expect(dish.quantity).to eql(3)
  end

end
