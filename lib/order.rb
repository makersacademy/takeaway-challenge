require_relative 'menu'

class Order 

	attr_reader :food

	def initialize(menu)
		@menu = menu
		@food = []
	end

	def select(dish_number)
		@food << @menu.dishes[dish_number]
	end

end
