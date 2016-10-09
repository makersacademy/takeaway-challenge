require_relative 'menu'

class Order 

	attr_reader :food, :total

	def initialize(menu)
		@menu = menu.dishes
		@food = {}
		@total = 0
	end

	def select(dish_number)
		dish = @menu[dish_number]
		raise 'We do not have a dish with that number!' unless dish
		@food.keys.include?(dish) ? @food[dish] += 1 : @food[dish] = 1
	end

	def calculate_total
		@food.each { |dish, quantity| @total += quantity*dish.price }
	end

end
