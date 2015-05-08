require 'order'

describe Order do
	let(:order) {Order.new}
	let(:Dish4) {double :dish, name: "Dish4", price: 10}
	
	it "has no dishes when created" do
		expect(order.dishes).to be_empty
	end

	it "can add a dish and corresponding quantity" do
		order.selection("Dish4", 4)
		expect(order.dishes).to eq(["Dish4", "Dish4", "Dish4", "Dish4"])
	end
end
