class Menu

	attr_reader :menu, :order


	def initialize(list_of_dishes, order_numbers = nil)
		@menu = list_of_dishes
		@order = order_numbers
	end


	def print_full_menu
		@menu
	end

	def print_order
		@menu.values_at(*@order)
	end
end