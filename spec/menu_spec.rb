require 'menu'

describe Menu do 

	subject(:menu) {described_class.new}

	describe '#menu' do

		it 'shows a list of dishes' do
			expect(menu.list_dishes).to eq(Hash.new)
		end

		it 'shows a list of dishes with prices' do
			expect(menu.prices).to eq(@prices)
		end
	end

end

