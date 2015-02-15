require 'menu'


describe Menu do
	let(:menu){Menu.new}

	it 'should have a list of food/drinks with prices' do
		expect(menu.menu_list).not_to be_empty
	end

end