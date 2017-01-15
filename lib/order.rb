class Order

	attr_reader :current_order, :total

	def initialize
		@current_order = []
		@total = 0.0
	end

	def add(food, quantity)
		quantity.times do			
			@current_order << food
		end
	end

	def add_to_total(price, quantity)
		@total += (quantity * price)
	end

	def print_order
		"#{@current_order.join(",\n")} \n Your current order total is £#{@total}"
	end

end