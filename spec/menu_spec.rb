require 'menu'

describe Menu do
	let(:menu) {Menu.new(["Dish1", "Dish2"])}
	let(:Dish1) {Double :dish, name: "Dish1", price: 10}
	let(:Dish2) {Double :dish, name: "Dish2", price: 10}
	let(:Dish3) {Double :dish, name: "Dish3", price: 10}

	it "should contain a list of dishes" do
		expect(menu.dish_list).to eq(["Dish1", "Dish2"])
	end

	it "should be able to add a dish into the menu" do
		menu.add("Dish3")
		expect(menu.dish_list).to eq(["Dish1", "Dish2", "Dish3"])
	end

end