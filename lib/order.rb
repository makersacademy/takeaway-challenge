require "menu"

class Order
	attr_accessor :menu, :dishes
	def initialize(menu)
		@dishes = {}
		@menu = menu
	end 

	def add_order(dish, number)
		raise "Sorry, we do not serve this" unless @menu.exist?(dish)
		@dishes[dish] = number
	end
	
	def total 
	 dish_total.inject(:+)
	end 

	def dish_total
		dishes.map { |dish, number| menu.price(dish) * number }
	end 
end 