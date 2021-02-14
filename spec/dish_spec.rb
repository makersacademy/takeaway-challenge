require 'dish'

describe Dish do
		let(:dish) {	Dish.new('Ramen', 9)	}
		describe '#initialize' do
				it 'should provide the dish with a name' do
						expect(dish.name).to be_a String
				end

				it 'should provide the dish with a price' do
						expect(dish.price).to be_a Integer
				end
		end 
end
