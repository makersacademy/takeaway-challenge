require 'menu'

describe Menu do
	
	describe '#initialize' do

		it 'is passed the dish class as an argument' do
			expect(subject.dish_class).to eq Dish
		end

		it 'sets a dishes array' do
			expect(subject.dishes).to be_an(Array)
		end

	end

	describe '#create_dishes' do

		it 'returns an array of dishes' do
			expect(subject.send(:create_dishes)).to be_an(Array).and include(Dish)
		end
	end

end