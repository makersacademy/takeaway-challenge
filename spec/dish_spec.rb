require 'dish'

describe Dish do
	
	describe '#new' do
		it 'accepts two arguments on initialization' do
			expect(Dish).to respond_to(:new).with(0).arguments
		end	
		it 'should raise ArgumentError if not passed a string first' do
			expect { Dish.new(:vindaloo, 3) }.to raise_error(ArgumentError, 'Expecting string')
		end	
		it 'should raise ArgumentError if not passed a integer second' do
			expect { Dish.new("vindaloo", "three") }.to raise_error(ArgumentError, 'Expecting integer')
		end	
	end

	describe '#to_hash' do
		subject(:dish) { Dish.new('vindaloo', 5) }
		it 'should return a hash with name and price' do
			expect(dish.to_hash).to eq({name: 'vindaloo', price: 5})
		end
	end

end
