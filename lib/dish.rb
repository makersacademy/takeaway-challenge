require_relative 'menu'

class Dish

	def initialize(name, price)
		val_name_price(name, price)
		@name = name
		@price = price
	end

	def to_hash
		{ name: @name, price: @price }
	end
	private

	def val_name_price(name, price)
		raise ArgumentError, "Expecting integer" unless price.is_a? Integer
		raise ArgumentError, "Expecting string" unless name.is_a? String
	end

end
