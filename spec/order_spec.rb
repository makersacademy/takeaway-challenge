require './lib/order'
require './lib/restaurant'

describe "Order" do

	it 'should start with an empty hash' do
		order = Order.new
		expect(order.my_order).to be_empty
	end

	it 'should have an item in the order hash' do
		order = Order.new
		pizza = Restaurant.new
		pizza.add("margarita", 10)
		pizza.add("pepperoni", 12)
		pizza.add("hawaiian", 12)
		order.select(pizza,"margarita")
		expect(order.my_order).not_to be_empty
	end

	it 'should return the total of the order' do
		order = Order.new
		pizza = Restaurant.new
		pizza.add("margarita", 10)
		pizza.add("pepperoni", 12)
		pizza.add("hawaiian", 12)
		order.select(pizza,"margarita")
		order.select(pizza,"pepperoni")
		order.select(pizza,"margarita")
		order.select(pizza,"pepperoni")
		order.select(pizza,"margarita")
		order.select(pizza,"pepperoni")
		expect(order.total).to eq 66
	end

end