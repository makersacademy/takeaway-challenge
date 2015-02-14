require 'dish_list'

class DishesList; include DishList; end

describe DishesList do

let(:curry) {double :dish, name: "curry", price: 500}
	let(:kebab){double :dish, name: "kebab", price: 450}


	it 'should be able to accept dishes' do
		menu = Menu.new
		expect(menu.list_count).to eq (0)
		menu.add_dish(curry)
		expect(menu.list_count).to eq (1)
	end

	it 'should be able to select a dish' do
		menu = Menu.new
		menu.add_dish(curry)
		menu.add_dish(kebab)
		expect(menu.select_dish(curry)).to eq curry
	end

end