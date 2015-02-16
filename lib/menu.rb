class Menu 

	attr_reader :menu

	def initialize
		@menu = []
	end

	def add_dish(dish)
		@menu << dish
	end

	def print
		result = ''
		@menu.each_with_index do |dish, index| 
			result <<	"#{index + 1}. #{dish.name} .... £#{dish.price} \n " 
		end
		result
	end

end

