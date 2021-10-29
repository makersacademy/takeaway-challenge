require "dish"

describe Dish do

  context ".price" do 
    it "should keep track of the current price of a dish" do 
      dish = Dish.new(:burger, 5.99)
      expect(dish.price).to be_a Float
    end 
  end

  context ".name" do 
    it "should hold a name for each dish as a symbol" do 
      dish = Dish.new(:burger, 5.99)
      expect(dish.name).to be_a Symbol
    end 
  end

end
