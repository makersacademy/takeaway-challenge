require 'menu'

describe Menu do 

	it 'responds to #pizzas by showing pizzas and prices' do
		expect(Menu.pizzas).not_to eq nil
	end

	it 'responds to #drinks by showing drinks and prices' do
		expect(Menu.drinks).not_to eq nil
	end
end

