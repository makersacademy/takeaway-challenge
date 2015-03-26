require 'dish'

describe 'Dish' do
	
	let(:dish) { Dish.new("Chicken and chorizo wrap", 12) }

	it 'should have a a name' do
		expect(dish.name).to eq("Chicken and chorizo wrap")
	end

	it 'should have a price associated' do
		expect(dish.price).to eq(12)
	end

end