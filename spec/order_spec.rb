require 'order'
require 'dish'
require 'menu'
require 'order_line'

describe Order do

		it 'should add a dish' do
			dish1 = Dish.new("Water", 2)
			order = Order.new
			order.add_dish(dish1, 5)
		end


		it 'should return a count of ordered dishes' do
			dish1 = Dish.new("Water", 2)
			order = Order.new
			order.add_dish(dish1, 5)
			expect(order.ordered_dish_count).to eq(1)

			dish2 = Dish.new("Sandwich", 5)
			order.add_dish(dish2, 5)

			expect(order.ordered_dish_count).to eq(2)
		end


		it 'should return the all the orders in the form of a list' do
			dish1 = Dish.new("Water", 2)
			order = Order.new
			order.add_dish(dish1, 5)
			
			dish2 = Dish.new("Sandwich", 5)
			order.add_dish(dish2, 5)

			p expect(order.order_line_list)
		end

		it 'should return the total price of the order' do
			dish1 = Dish.new("Water", 2)
			order = Order.new
			order.add_dish(dish1, 5)
			
			dish2 = Dish.new("Sandwich", 5)
			order.add_dish(dish2, 5)

			p expect(order.order_line_list)
			p expect(order.order_total)
		end




end
