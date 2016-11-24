class Customer

	def initialize
		@order = []
	end

	def order
		@order
	end

	def add_item(item, order_count = 1)
		order_count.times do
			@order << item
		end
	end

end