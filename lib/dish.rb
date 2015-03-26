class Dish


	def initialize(name, price)
			@name = name
			@price = price
	end

	# getters
	def name
		@name
	end

	def price
		@price
	end

	# setters
	def dish(name)
		@name = name
	end

	def dish(price)
		@price = price
	end


end