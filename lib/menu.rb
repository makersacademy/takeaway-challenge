# deals with menu content and selection

class Menu

	attr_reader :dishes

	def initialize(dishes)
		@dishes = dishes
	end

	def print
 		dishes.map do |title, price| 
 		"%s £%.2f" % [title.to_s, price]
 		end.join(', ')
 	end

 	def price(dish)
 		dishes[dish]
 	end
end

