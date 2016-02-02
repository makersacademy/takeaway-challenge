require 'menu'

describe Menu do 

	subject(:menu) {described_class.new(dishes)}

	let(:dishes) do
		{
		chicken: 3.99,
		falafel: 4.50
		}
	end  #can make double value a hash!

	it 'has a list of dishes with prices' do
		expect(menu.dishes).to eq(dishes)
	end

	it 'prints a list of dishes with prices' do
		printed_menu = 'chicken £3.99, falafel £4.50'
		expect(menu.print).to eq(printed_menu)
	end

	it 'calculates a price' do
		expect(menu.price(:chicken)).to eq(dishes[:chicken])
	end
end



