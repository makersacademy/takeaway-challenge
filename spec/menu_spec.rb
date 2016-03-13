require 'menu'

describe Menu do 

subject(:menu) {described_class.new}

	describe '#initialize' do

		it 'has an empty array' do
			expect(menu.menu_list).to be_empty
		end

	end

	describe '#add_dish' do
	
		it 'to the menu_list' do
			expect{menu.add_dish("apple",1)}.to change{menu.menu_list.length}.by 1
		end
	end

	describe '#delete_dish' do

		it 'from the menu_list' do
			menu.add_dish("apple", 1)
			expect{menu.delete_dish("apple")}.to change{menu.menu_list.length}.by -1
		end
	end

	describe '#menu_list' do

		it 'shows you all the items on the menu' do
			menu.add_dish("apple", 1)
			expect(menu.menu_list["apple"]).to eq 1
		end
	end

	describe '#find' do

		it 'returns false if dish is not on the menu' do
			menu.add_dish("apple", 1)
			expect(menu.find("pear")).to eq false
		end

	describe '#find_price_of' do

		it 'returns the price of a dish' do
			menu.add_dish("apple", 1)
			expect(menu.find_price_of("apple")).to eq 1
		end
	end

end

end