require 'menu'

describe Menu do 


let(:dish1) {double :dish1, :item => "apple"}
let(:dish_class) {double(:dish_class, new: dish1) }
subject(:menu) {described_class.new(dish_class)}

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
			expect(menu.menu_list).to eq [dish1]
		end
	end

end