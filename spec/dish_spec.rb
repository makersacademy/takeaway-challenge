require 'dish'

describe Dish do

	subject(:dish) {described_class.new("Chicken Chow Mein", 52, 3)}


	it 'has a number' do
		expect(dish.number).to eq 52
	end

	it 'can show its name' do
		expect(dish.name).to eq "Chicken Chow Mein"
	end

	it 'can show its price' do
		expect(dish.price).to eq 3
	end
end