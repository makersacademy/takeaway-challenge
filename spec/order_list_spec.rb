require 'order_list'
require 'menu_item_list'


RSpec.describe OrderList do

	let(:item1) 	{ MenuItem.new('name1', 1) }
	let(:item2) 	{ MenuItem.new('name2', 2) }
	let(:item3) 	{ MenuItem.new('name3', 3) }
	let(:menu_list)	{ MenuItemList.new([ item1, item2, item3 ]) }
	let(:orderlist) { OrderList.new(menu_list, [0,2,1]) }
	

	it 'prints first and last dish number' do
		expect( orderlist.items.first ).to eq(0)
		expect( orderlist.items.last ).to eq(1)
	end

	it 'returns order numbers by index' do
		expect( orderlist.items[1] ).to eq(2)
	end

	it 'returns the total for the order' do
		expect( orderlist.total ).to eq(6)
	end

end