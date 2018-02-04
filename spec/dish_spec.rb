require "dish"

describe Dish do

  let(:dish) {dish = Dish.new(1)}
  let(:dish_info) {"Dish number: 1. Dish name: Beef burger. Price: £10"}

  it 'Creates a new dish using SKU# including the correct name' do
    expect(dish.name).to eql("Beef burger")
  end

  it 'Creates a new dish including a price' do
    expect(dish.price).to eql(10)
  end

  it "Create a new dish with a custom quantity" do
    dish = Dish.new(1, 3)
    expect(dish.quantity).to eql(3)
  end

  it "Returns the information related to that dish" do
    expect(dish.info).to eq(dish_info)
  end

end
