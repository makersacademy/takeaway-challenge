require 'menu'
	
describe Menu do

	it 'initializes with items on the menu' do
		menu = Menu.new
		expect(menu.items).not_to be_empty
	end

	it 'displays the food and prices' do
		menu = Menu.new
		expect(menu.display_menu).to eq(nil)
	end

end