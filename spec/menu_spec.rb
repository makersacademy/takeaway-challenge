require 'menu'

describe JapaneseMenu do

	subject(:menu) {described_class.new}

	describe '#view' do
		it 'shows the menu' do
			expect(menu.view).to eq JapaneseMenu::MENU
		end
	end

	describe '#price' do
		it 'returns price of item' do
			expect(menu.price("edamame")).to eq 3
		end
	end

end
