require 'menu'


RSpec.describe Menu do

	let(:item1) 	{ { name: 'name1', price: 1 } }
	let(:item2) 	{ { name: 'name2', price: 2 } }
	let(:item3) 	{ { name: 'name3', price: 3 } }
	let(:menu_list)	{ [ item1, item2, item3 ] }
	let(:order_list) { [0,-1] }
	subject(:menu) { described_class.new(menu_list) }



	context 'Menu Printer' do

		it 'prints a list of dish names and their prices' do
			expect( menu.print ).to eq(menu_list)
		end
	end


	context 'Order Printer' do

		let(:my_order) { described_class.new( menu_list, order_list ) }
		let(:printed_order) { [item1, item3] }


		it 'prints a list of selected dishes' do
			expect(my_order.print).to eq(printed_order)
		end


		it 'checks the total for my order' do
			expect(my_order.sum).to eq(item1[:price]+item3[:price])
		end


	end


end