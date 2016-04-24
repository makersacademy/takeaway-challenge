class Menu
	attr_reader :dishes

	def initialize(dishes)
		@dishes = dishes
	end

	def display
		dishes.map{|food,value| format("%s £%0.2f", food.capitalize,value)}.join("\n")
	end

	def dish?(dish)
		!dishes[dish].nil?
	end

	def price(dish)
		dishes[dish]
	end
	def price(dish)
		dishes[dish]
	end

end