class Order

	attr_reader :my_order

	def initialize
		@my_order = {}
	end

	def select(restaurant, dish)
		restaurant.dishes.each{
			|key, value|
			if key == dish
				if @my_order.has_key? key
					nuVal = (@my_order.fetch(key)) + value
					@my_order.store(key,nuVal)
				else
					@my_order.store(key,value)
				end
			end
		}
	end

	def total
		puts @my_order
		total = 0
		@my_order.each{
			|key, value|
			total += value
		}
		total
	end
	
end