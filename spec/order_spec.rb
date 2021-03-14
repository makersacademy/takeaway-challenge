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
		expect(subject).to respond_to(:add)
	end
end