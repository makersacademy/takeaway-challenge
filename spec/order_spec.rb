
require 'order'
require 'menu'

describe Order do
	
	describe '#select_menu' do
		subject(:order) { Order.new }
		it 'should return an Menu object' do 
			menu = Menu.new.load_csv('test_menu.csv')
			expect(order.select_menu(1)).to be_an_instance_of(Menu)
		end
	end
	describe '#select_dish' do
		subject(:order) { Order.new }
		it 'returns error if no menu is selected first' do
			expect(order.select_menu(1)).to raise_error ArgumentError, 'No menu selected'
		end
	end
	describe '#list_orders' do
		subject(:order) { Order.new }
	end
	describe '#select_dishes' do
		subject(:order) { Order.new }
	end
end


