class Order

	attr_reader :basket, :total

	def initialize
		@basket = []
		@total = 0.00
	end

	def add(food, quantity)
		quantity.times do			
			@basket << food
		end
	end

	def add_to_total(price, quantity)
		@total += (quantity * price)
	end

	def view_order
		"#{@basket.join(",\n")} \n Your current order total is £#{@total}"
	end
end
