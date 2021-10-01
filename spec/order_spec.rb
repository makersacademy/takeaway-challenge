require "order"

describe Order do

  context ".dishes" do 
    it "should keep an array of Dish objects" do 
      expect(subject.dishes).to be_a Array
    end 
  end

  describe ".add_dish" do 
    it "should add a dish object to the dishes array if it receives a string which is on the menu" do 
      subject.add_dish(["pizza", "fanta"])
      expect(subject.dishes[0]).to be_a Dish
    end

    it "should raise an error when trying to order something not on the menu" do 
      expect { subject.add_dish(["muffin"]) }.to raise_error("This dish is not on the menu")
    end
  end

  context ".total" do 
    it "should keep the price of each dish in the dishes array" do 
      subject.add_dish(["pizza", "fanta"])
      expect(subject.total).to be_a Float
    end
  end

  describe ".accumulator" do 
    it "should keep a running total of the price of dishes added" do
      subject.add_dish(["pizza", "fries"])
      expect(subject.total).to eql(2.99 + 10.49)
    end
  end

  describe "menu_listing" do 
    it "should list the menu hash" do 
      expect(subject.menu_listing[0]).to eql("fries: £2.99")
    end
  end
end 
