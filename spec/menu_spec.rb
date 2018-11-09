require 'menu'
require 'dish'

describe Menu do
	let(:dish) {dish = instance_double("Dish1", price: 1.99)}
	
	it 'should display a list of available dishes' do
		menu = Menu.new(dish)
		expect(menu.show_menu).to include(dish)
	end

	it 'should include the price of the dishes' do
		menu = Menu.new(dish)
		expect(menu.show_menu).to include(dish)
	end

	it 'menu items should be indexed' do

	end
end