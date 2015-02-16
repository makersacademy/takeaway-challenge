require 'dish'

describe Dish do
	
	let (:dish) {Dish.new("Water", 1)}

	# need to learn how to write this test
	it 'must be initialized with dish' 
		#expect{ dish = Dish.new("Water", 1) }.
	

	it 'should have a name' do
		# dish = Dish.new("Water", 1)
		expect(dish.name).to eq("Water")
	end
	
	it 'should have a price' do
		expect(dish.price).to eq(1)
	end

	

end