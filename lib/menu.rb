class Menu

	attr_reader :dishes

	def initialize(dishes)
		@dishes = dishes
	end

	def show
		dishes.map do |dishes, prices|  
			"%s £%.2f" % [dishes.to_s.capitalize, prices]
		end.join(", ")
	end

	def price(dish)
		dishes[dish]
	end
end