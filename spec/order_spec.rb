require 'order'
require 'menu'


RSpec.describe Order do

	let(:item1) 	{ { name: 'name1', price: 1 } }
	let(:item2) 	{ { name: 'name2', price: 2 } }
	let(:item3) 	{ { name: 'name3', price: 3 } }
	let(:menu_list)			{ [ item1, item2, item3 ] }
	let(:menu_selection)	{ [ item1, item3 ] }

	subject(:menu) { Menu.new(menu_list) }
	subject(:order) { described_class.new( menu_selection, menu.print_items ) }


	it 'would like to select one or more dishes' do
		expect(order.print_order).to eq(menu_selection)
	end


	# So that I can verify that my order is correct
	# I would like to check that the total I have been given matches the sum of the various dishes in my order
	xit '' do
	end


end