require 'menu'
require 'menu_item_list'
require 'menu_item'


RSpec.describe Menu do

	let(:item1)	{ MenuItem.new('name1', 1) }
	let(:item2)	{ MenuItem.new('name2', 2) }
	let(:item3)	{ MenuItem.new('name3', 3) }
	let(:full_menu)	{ MenuItemList.new([ item1, item2, item3 ]) }

	let(:my_order)	{ OrderList.new(full_menu, [0,1]) }
	let(:menu)	{ Menu.new(full_menu) }
	let(:selected_dishes) { Menu.new(full_menu,my_order) }



	it 'prints the full menu' do
		expect(menu.print).to eq([ item1, item2, item3 ])
	end

	it 'prints a list of selected dishes' do
		expect(selected_dishes.print).to eq( [ item1, item2 ] )
	end

	it 'sends a confirmation message on completion of order' do
		time = selected_dishes.delivery_time
		message = 'Thank you! Your order was placed and will be delivered before ' + time
		expect(selected_dishes.place_order).to eq(message)
	end


end