require 'menu'

describe Menu do 

	let (:menu) {Menu.new}
	let (:dish)	{double :dish}
	let (:price) {double :price}



	it 'can add a new "Sushi" dish to the list of dishes' do
		expect(menu.add_dish("Sushi")).to eq ["Sushi"]
	end


	it 'can add any new dish to the list of dishes' do
		expect(menu.add_dish(dish)).to eq [dish]
	end


	it 'can add a price of 10 to the list of prices' do
		expect(menu.add_price(10)).to eq [10]
	end


	it 'can add any price to the list of prices' do
		expect(menu.add_price(price)).to eq [price]
	end

	it 'can match the dish "Sushi" with its price 10' do 
		expect(menu.match("Sushi",10)).to eq ({"Sushi" => 10})
	end




end
