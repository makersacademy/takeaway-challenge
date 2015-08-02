require 'menu'

include Menu

describe Menu do 

	it 'has a hash with all the dishes' do 
		expect(subject.dishes).not_to be_empty
	end

	it 'can extract a price of a dish' do 
		expect(subject.price("Fries")).to eq 2.95
	end 
end 