class Order

	attr_reader :my_order

	def initialize
		@my_order = {}
	end

	def select(restaurant, dish)
		restaurant.dishes.each{
			|key, value|
			if key == dish
				@my_order.store(key,value)
			end
		}
	end
	
end