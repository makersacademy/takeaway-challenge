require 'dish'

describe Dish do
	it 'has a name and a price' do
		dish = Dish.new('pizza', 3)
		expect(dish.name && dish.price).to eq 'pizza' && 3
	end


end
