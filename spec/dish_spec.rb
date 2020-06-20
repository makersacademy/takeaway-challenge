require "dish"

describe Dish do
  
  describe "initialize" do
    
    it "creates an instance of a dish" do
      dish = Dish.new("Sushi", 4)
      expect(dish).to be_an_instance_of(Dish)
    end
    it "returns the name of a dish" do
      dish = Dish.new("Sushi", 4)
      expect(dish.name).to eq("Sushi")
    end

    it "returns the price of a dish" do
      dish = Dish.new("Sushi", 4)
      expect(dish.price).to eq(4)
    end
  end
 end
 