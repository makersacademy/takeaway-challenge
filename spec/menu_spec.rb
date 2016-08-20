require 'menu'

describe Menu do

let(:menu) {described_class.new}

	context '#show_menu' do

		it 'shows a list of available items on the menu' do
			expect(menu.show_menu).to respond_to :each	
		end

	end

	context '#add_to_menu' do

		it 'allows you to add to the menu' do
			menu.add_to_menu(:fish, 2.00)
			expect(menu.food_list).to include :fish

		end

	end

	context '#food_list' do

		it 'allows you to see the food list' do

			menu.add_to_menu(:horse, 2.00)
			expect(menu.food_list).to include :horse

		end

	end

end
