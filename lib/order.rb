class Order

	attr_reader :menu_list, :ordered_items, :running_total

	def initialize(menu_list)
		@menu_list = menu_list
		@ordered_items = []
		@running_total = 0
	end

	def add_to_order(item, qty)
		@ordered_items << [item, qty]
		@running_total += @menu_list[item] * qty
	end

end