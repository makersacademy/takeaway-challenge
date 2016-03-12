require 'menu'

describe Menu do 

subject(:menu) {described_class.new}
let(:dish) { double :dish }

	describe '#initialize' do

		it 'has an empty array' do
			expect(menu.list).to be_empty
		end

	end

	describe '#add_dish' do
	
		it 'to the menu' do
			expect{menu.add_dish(dish)}.to change{menu.list.length}.by 1
		end
	end

	describe '#delete_dish' do

		it 'from the menu' do
			menu.add_dish(dish)
			expect{menu.delete_dish(dish)}.to change{menu.list.length}.by -1
		end
	end

end