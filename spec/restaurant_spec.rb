require './lib/restaurant'

describe "Restaurant" do

	it 'should initialise with an empty hash' do
		pizza = Restaurant.new
		expect(pizza.dishes).to be_empty
	end

	it 'should add items to the hash' do
		pizza = Restaurant.new
		pizza.add("margarita", 10)
		expect(pizza.dishes).to include("margarita" => 10)
	end

	it 'should show the menu' do 
		pizza = Restaurant.new
		pizza.add("margarita", 10)
		pizza.add("pepperoni", 12)
		pizza.add("hawaiian", 12)
		expect(pizza.menu).to include("hawaiian" => 12, "margarita" => 10, "pepperoni" => 12)
	end

end