require 'dish'


describe Dish do

	let(:dish) { described_class.new }

	describe '#initialize' do
		it 'instantiates #name to eq Teriyaki Chicken' do
			expect(dish.name).to eq "Teriyaki Chicken"
		end

		it 'instantiates #price to eq 6.20' do
			expect(dish.price).to eq "6.20"
		end
	end

	describe '#print_price' do
		it 'returns formatted price' do
			expect(dish.print_price).to eq "£6.20"
		end
	end

	describe '#money' do
		it 'return object of money' do
			expect(dish.money).to be_instance_of(Money)
		end
	end

end