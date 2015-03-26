require 'order_line'
require 'dish'
require 'menu'
require 'order'

describe Order_line do
	
	it 'should return the dish name and its quantity' do
			order_line = Order_line.new("Water", 2)
			dish1 = Dish.new("Water", 2)
			order = Order.new
			order.add_dish(dish1, 5)

			p order_line.qty
			p order_line.dish
	end


end