require 'menu'
describe Menu do
	subject(:menu) { described_class.new(dishes) }
	let(:dishes) do
		{
			kurma: 4.80, 
			 madras: 4.50,
			 vindaloo: 5.00

		}
	end
	it 'shows a list of dishes with prices' do
		expect(menu.dishes).to eq(dishes)
	end

	it 'prints a list of dishes with prices' do
		menu_items = "Kurma £4.80, Madras £4.50, Vindaloo £5.00" 
		expect(menu.show).to eq(menu_items)
	end

end