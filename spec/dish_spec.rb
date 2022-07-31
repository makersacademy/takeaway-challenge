require './lib/dish'

describe "Dish" do

	it "should have a name" do
		dish = Dish.new("pizza", 10)
		expect(dish.name).to eq "pizza" 
	end

	it "should have a price" do
		dish = Dish.new("pizza", 10)
		expect(dish.price).to eq 10
	end

end