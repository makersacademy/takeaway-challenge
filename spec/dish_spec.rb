require 'dish.rb'

RSpec.describe Dish do

    it "constructs a dish" do
        dish = Dish.new("pizza", 10)
        expect(dish.name).to eq "pizza"
        expect(dish.price).to eq 10
    end


end