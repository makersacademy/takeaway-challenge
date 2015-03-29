require 'dish'

describe Dish do 
	let(:dish) { Dish.new("Dish Description", 10) }

	it "should have a description or name assigned to it" do
		expect(dish.name).to eq("Dish Description")
	end

	it "should have a price assigned to it" do
		expect(dish.price).to eq(10)
	end

end
