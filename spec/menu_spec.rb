require 'menu'


describe Menu do
	let(:fish_and_chips){double :dish, name: "Fish and chips", price: 15}
	let(:rib_eye){double :dish, name: "Rib eye", price: 20}
	let(:tajine) { double :dish, name: "Tajine", price: 25}
	let(:menu){Menu.new([fish_and_chips, rib_eye])}
	

	it 'should have a list of food on the menu' do
		expect(menu.menu_list).to eq([fish_and_chips, rib_eye])
	end

	it 'should be able to add a dish into the menu' do
		expect(menu.menu_list).to eq([fish_and_chips, rib_eye])
		menu.add(tajine)
		expect(menu.menu_list).to eq([fish_and_chips, rib_eye, tajine])
	end
end