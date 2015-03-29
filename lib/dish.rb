class Dish

	# attr_reader :has_name, :has_price

	# def initialize has_name, has_price
	# 	@has_name = name
	# 	@has_price = price
	# end
	attr_reader :name

	def initialize(name)
		@name = name
	end
end