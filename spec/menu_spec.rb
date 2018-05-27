require 'menu'

RSpec.describe Menu do

	let(:item1) 	{ { name: 'name1', price: 1 } }
	let(:item2) 	{ { name: 'name2', price: 2 } }
	let(:item3) 	{ { name: 'name3', price: 3 } }
	let(:menu_list)	{ [ item1, item2, item3 ] }

	subject(:menu) { described_class.new(menu_list) }


	it 'contains a list of dish names and their prices' do
		expect(menu.print_items).to eq menu_list
	end






end