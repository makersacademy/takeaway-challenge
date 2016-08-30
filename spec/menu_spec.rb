require 'menu'

describe Menu do
	subject(:menu) {described_class.new(dishes)}
	let(:dishes) do
		{
			Pizza: 14.00,
			Nuggets: 5.50
		}
	end

	it 'records the different dishes and prices' do
		expect(menu.dishes).to eq(dishes)
	end
	it 'prints out the list of dishes and prices' do
		printed_menu = "Pizza £14.00, Nuggets £5.50"
		expect(menu.print).to eq(printed_menu)
	end
end