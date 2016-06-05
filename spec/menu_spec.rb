require 'menu'

describe Menu do

	subject(:menu) {described_class.new}

	it "displays a hash of menu items and prices" do
		expect(menu.display_menu).to eq Menu::STANDARD_MENU
	end

	describe '#item_price' do

		it "displays the price of a menu item" do
			expect(menu.item_price("veggie")).to eq 4.00
		end

	end
	
end