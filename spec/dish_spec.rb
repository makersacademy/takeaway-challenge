require "dish.rb"

describe Dish do
  
  new_dish = (:dish_name => "Mock Dish", :dish_price => 6, :is_available => true)

  it "has a name" do
    new_dish = Dish.new
    expect(new_dish.dish_name).to eq(new_dish.dish_name)
  end

  it "has a price" do
    new_dish = Dish.new
    expect(new_dish.dish_price).to eq(new_dish.dish_price)
  end

  it "has a default availability status of true" do
    new_dish = Dish.new
    expect(new_dish.is_available).to eq(true)
  end
end