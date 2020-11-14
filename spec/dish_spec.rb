require 'dish'

describe Dish do

    it "should create a new instance of dish" do
        dish = Dish.new
    expect(dish).to be_kind_of(Dish)
    end

    it "should be able to see a list of dishes" do
        dish = Dish.new
        expect(dish.menu).to include("Pizza")
    end 
    
    it "should be able to select a number of dishes from the menu" do
        dish = Dish.new
        selection = ("Curry"),(5)
        selection = ("Pie"),(4)
       expect(dish.selection()).to include(selection + selection)
    end
end