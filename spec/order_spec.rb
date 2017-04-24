
require 'order'
require 'menu'

describe Order do
	
	describe '#select_menu' do
		subject(:order) { Order.new }
		it 'should return an Menu object' do 
			menu = Menu.new.load_csv('test_menu.csv')
			expect(order.select_menu(1)).to be_an_instance_of(Menu)
		end
		it 'returns error if menu selected is not valid number' do
			expect { order.select_menu(5) }.to raise_error ArgumentError, 'Not a valid menu number'
		end
	end
	describe '#select_dish' do
		subject(:order) { Order.new }
		it 'returns error if no menu is selected first' do
			expect { order.select_dish('pasta', 1) }.to raise_error ArgumentError, 'No menu selected'
		end
		it 'returns error if dish name is not valid' do
			menu = Menu.new.load_csv('test_menu.csv')
			order.select_menu(1)
			expect { order.select_dish('pasta', 1) }.to raise_error ArgumentError, 'Not valid dish name'
		end
		it 'returns error if quantity is not integer' do
			menu = Menu.new.load_csv('test_menu.csv')
			order.select_menu(1)
			expect { order.select_dish('vindaloo', 1.5) }.to raise_error ArgumentError, 'Quantity must be whole number'
		end
		it 'should add a dish to @dishes' do
			menu = Menu.new.load_csv('test_menu.csv')
			order.select_menu(1)
			expect { order.select_dish('vindaloo', 1) }.to change{ order.dishes.length }.by 1
		end
	end
	describe '#list_orders' do
		subject(:order) { Order.new }
	end
	describe '#raise_total' do
		subject(:order) { Order.new }
		it 'should return the correct total bill for @dishes' do
			menu = Menu.new.load_csv('test_menu.csv')
			order.select_menu(1)
			order.select_dish('vindaloo', 2)
			expect(order.raise_total).to eq 6
		end
	end
end


