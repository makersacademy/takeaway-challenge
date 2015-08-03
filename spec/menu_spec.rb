require 'menu'

describe Menu do

	it 'has a corresonding price for a food item' do
		expect(subject.food['salmon sashimi']).to eq(4.00)
	end

	it 'returns a list of food items and prices' do
		expect(subject.food).to eq({'salmon sashimi' => 4.00, 
							'tempura handroll' => 3.50,
							'agedashi tofu' => 2.00,
							'spicy tuna maki' => 3.00,
							'spicy beef donburi' => 7.00})
	end

	
end