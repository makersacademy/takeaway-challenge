require "dish"

describe Dish do
  describe ".initialize" do
    it "should create a new Dish instance with a name and price" do
      chips = Dish.new("chips", 2.50)
      expect(chips.price).to eq(2.50)
    end
  end
end