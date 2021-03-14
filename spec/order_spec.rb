require './lib/order.rb'

describe Order do
	it 'has somewhere to store dishes chosen by user' do
		expect(subject.basket).to eq([])
	end

	it 'is able to add a dish to the basket' do
		subject.add(2)
		expect(subject.basket).to eq([{:dish_number => 2, :dish => 'Beef', :price => 10}])
	end

	it 'is able to add multiple dishes to the basket' do
		subject.add(3)
		subject.add(4)
		expect(subject.basket).to eq([{:dish_number => 3, :dish => 'Lamb', :price => 10}, {:dish_number => 4, :dish => 'Prawns', :price => 10}])
	end

	it 'total matches the sum of various dishes' do
		subject.add(5)
		subject.add(6)
		expect(subject.total).to eq(14)
	end
end