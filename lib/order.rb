class Order

	attr_reader :dishes, :menu

	def initialize(menu)
		@menu = menu
		@dishes = {}
	end

	def add(dish, number)
		@dishes[dish] = number
	end

	def order_total
		total = dishes.map do |dish, number|
			menu.price(dish) * number
		end
			total.inject(:+)
	end

end