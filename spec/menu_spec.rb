require 'menu'

describe Menu do

	subject(:menu) {described_class.new}

	it "displays a hash of menu items and prices" do
		expect(menu.display_menu).to eq Menu::STANDARD_MENU
	end
	
end