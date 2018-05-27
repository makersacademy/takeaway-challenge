require 'MenuItemList'
require 'MenuItem'


RSpec.describe MenuItemList do

	let(:item1) 	{ MenuItem.new('name1', 1) }
	let(:item2) 	{ MenuItem.new('name2', 2) }
	let(:item3) 	{ MenuItem.new('name3', 3) }
	let(:menu_list)	{ MenuItemList.new([ item1, item2, item3 ]) }


	context 'MenuItemList test cases' do

		it 'prints first and last dish name' do
			expect( menu_list.items.first.dish_name ).to eq(item1.dish_name)
			expect( menu_list.items.last.dish_name ).to eq(item3.dish_name)
		end

		it 'prints first and last dish price' do
			expect( menu_list.items.first.dish_price ).to eq(item1.dish_price)
			expect( menu_list.items.last.dish_price ).to eq(item3.dish_price)
		end

		it 'chacks name and price by index method' do
			expect( menu_list.name(1) ).to eq(item2.dish_name)
			expect( menu_list.price(1) ).to eq(item2.dish_price)
		end
	end

end