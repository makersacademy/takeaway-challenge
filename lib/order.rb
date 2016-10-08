require_relative 'menu'

class Order 

	attr_reader :food, :total

	def initialize(menu)
		@menu = menu.dishes
		@food = []
		@total = 0
	end

	def select(dish_number)
		raise 'We do not have a dish with that number!' if @menu[dish_number] == nil
		@food << @menu[dish_number]
	end

	def calculate_total
		@food.each do |dish|
			@total += dish.price
		end
	end

end
