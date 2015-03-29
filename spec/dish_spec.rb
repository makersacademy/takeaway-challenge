require 'dish'

describe Dish do 
	let(:dish) { Dish.new("Chicken") }

	it "should have a description or name assigned to it" do
		expect(dish.name).to eq("Chicken")
	end

	# it "should have a price assigned to it" do
	# 	expect(dish).to have_price
	# end

end