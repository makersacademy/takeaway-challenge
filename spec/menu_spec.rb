require 'menu'

describe Menu do

	subject(:menu) { described_class.new(list) }

	let(:list) do
		{
			hotdog: 2.50, 
			pizza: 4.99, 
			sushi: 5.25, 
			bagel: 3.49,
			sandwich: 2.99, 
			drink: 1.99
		}
	end	

	it 'has list of items with prices' do
		expect(menu.list).to eq(list)
	end

	it 'generates item list' do
		printed_menu = "Hotdog £2.50, Pizza £4.99, Sushi £5.25, Bagel £3.49, Sandwich £2.99, Drink £1.99"
		expect(menu.print).to eq(printed_menu)
	end	   
end

