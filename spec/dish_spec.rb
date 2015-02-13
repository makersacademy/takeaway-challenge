require 'dish'

describe Dish do 

	it 'should know its name' do
		curry = Dish.new "curry"
		expect(curry.name).to eq "curry"
	end

	it 'should know it\'s price' do
		curry = Dish.new("curry",400)
		expect(curry.price).to eq 400
	end




	
end