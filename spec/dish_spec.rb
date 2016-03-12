require './lib/dish'

describe Dish do 

subject(:dish) {described_class.new("Hummus", 2)}

	describe '#initialize' do

		it 'assigns a dish item' do
			expect(dish.item).to eq "Hummus"
		end

		it 'assigns a price' do
			expect(dish.price).to eq 2
		end
	end

	
end