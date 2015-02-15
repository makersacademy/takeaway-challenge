require 'menu'


describe Menu do
	let(:fish_and_chips) { double :dish, name: "Fish and chips", price: 15 }
	let(:menu){Menu.new([fish_and_chips])}
	

	it 'should have an item on the menu' do
		expect(menu.menu_list).to eq([fish_and_chips])
	end
end