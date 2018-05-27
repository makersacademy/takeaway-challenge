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
		message = 'Thank you! Your order was placed and will be delivered before ' + delivery_time
		message if orders?
	end

	def delivery_time
		(Time.now+3600).strftime('%H : %M').delete(' ')
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



