class Dish

private
	attr_reader :name, :price
public

	def initialize data: 
		@name = data[:name]
		@price = data[:price]
	end

	def get_name
		name
	end
	def get_price
		price
	end

end