class Order

	attr_reader :dishes, :total_order

	def initialize
		@dishes = []
	end

	def selection(dish, quantity)
		order = quantity.times.map{dish}
		@dishes << order
	end

	def total_order
		@dishes.inject(0){|i, dish| i + dish.price}
	end

end