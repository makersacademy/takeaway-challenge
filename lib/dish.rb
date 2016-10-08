class Dish

	attr_reader :name, :price, :number

	def initialize(name, number, price)
		@name = name
		@price = price
		@number = number
	end

end