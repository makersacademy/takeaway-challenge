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

	describe '#has_item?' do
		it 'raises an error if item is not on menu' do
			message = "Abc is not on the menu!"
			expect{menu.has_item?("abc")}.to raise_error message
		end
	end

end
