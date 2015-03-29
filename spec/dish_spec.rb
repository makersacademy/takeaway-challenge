require 'dish'

describe Dish do 

	it "should have a description or name assigned to it" do
		dish = Dish.new
		expect(dish).to have_name
	end

	it "should have a price assigned to it" do
		dish = Dish.new
		expect(dish).to have_price
	end

end