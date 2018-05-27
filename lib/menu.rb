class Menu

	attr_reader :menu, :order


	def initialize(full_menu, my_order = nil)
		@menu = full_menu
		@order = my_order
	end


	def print
		orders?? print_order : print_full_menu
	end


	def place_order
		message = 'Thank you! Your order was placed and will be delivered before 18:52'
		message if orders?
	end



	private
	def print_full_menu
		@menu.items
	end

	def print_order
		@menu.items.values_at(*order.items)
	end

	def orders?
		!!order
	end

end



