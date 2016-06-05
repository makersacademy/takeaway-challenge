class Order

	def initialize
		@order = Hash.new(0)
	end

	def add(item, qty = 0)
		@order[item] += qty
	end

	def include?(item)
		@order.include?(item)
	end

end