require "dish"

describe Dish do
  context "#initialize" do
    it "has a name" do
      dish = Dish.new
      expect(dish.name).to eq(dish.name)
    end
    it "has a price" do
      dish = Dish.new
      expect(dish.price).to eq(dish.price)
    end
  end
end
