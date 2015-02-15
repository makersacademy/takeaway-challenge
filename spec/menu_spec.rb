require 'menu'


describe Menu do
	let(:menu){Menu.new}

	it 'should have a list of food/drinks' do
		expect(menu.menu_list).not_to be_empty
	end
	
	it 'should have food and drinks with the corresponding price' do
		expect(menu.menu_list.values).to include {keys :true}
	end
end