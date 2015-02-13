require 'menu'

describe Menu do

	let(:dish) {double :dish}

	it 'should be able to accept dishes' do
		menu = Menu.new
		expect(menu.list_count).to eq (0)
		menu.add_dish(dish)
		expect(menu.list_count).to eq (1)
	end



	
end