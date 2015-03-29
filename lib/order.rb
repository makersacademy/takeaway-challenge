class Order

attr_reader :dishes, :sum_order

	def initialize
		@dishes = []
	end

	def selection(dish, quantity)
		order = quantity.times.map{dish}
		@dishes.concat order
	end
end