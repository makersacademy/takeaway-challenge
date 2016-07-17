class Dish

	attr_reader :name, :price

	def initialize data: 
		@name = data[:name]
		@price = data[:price]
	end

end