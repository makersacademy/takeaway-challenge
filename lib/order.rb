class Order

	attr_reader :food_list

	def initialize
		@food_list = {}
	end

	def add(item, quantity)
		food_list.store(item,quantity)
	end

end
