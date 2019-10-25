require "dish"

describe Dish do

    it "should create a new instance of dish" do
        dish = Dish.new
    expect(dish).to be_kind_of(Dish)
    end
end

