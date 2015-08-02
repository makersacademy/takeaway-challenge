require 'menu'

describe Menu do

	it 'has a corresonding price for a food item' do
		expect(subject.food['salmon sashimi']).to eq(4.00)
	end

	
end