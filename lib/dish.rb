require 'money'

class Dish

	attr_reader :name, :price

	def initialize(name = "Teriyaki Chicken", price = "%.2f" % 6.20)
		@name = name
		@price = price 
	end

	def money
		Money.new(@price.to_s.gsub(".",'').to_i, "GBP")
	end

	def print_price
		money.format(:symbol => true)
	end

end