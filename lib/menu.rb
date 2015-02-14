class Menu

	attr_accessor :dish, :price

	def initialize
		@dish = dish
		@price = price
	end


	def dishes
		@dishes ||= []
	end


	def prices
		@prices ||= []
	end


	def add_dish(dish)
		dishes << dish
	end


	def add_price(price)
		prices << price
	end


	def match(dish,price)
		dish.to_s
		dish.to_i
		hash = {dish => price}
	end








end