require 'menu'


describe Menu do

	let(:dish) {double :dish}
	
	it 'can take a dish and place in menu' do
		menu = Menu.new
		menu.add_dish(dish)
		expect(menu.menu).to include dish
	end

	it 'can show customer what is on menu' do
		menu = Menu.new
		burger = double(:dish, name: "Burger", price: 5)
		coke = double(:dish, name: "Coke", price: 2)
		menu.add_dish(burger)
		menu.add_dish(coke)
		expect(menu.print).to eq "1. Burger .... £5 \n 2. Coke .... £2 \n "
		
	end


end