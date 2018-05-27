class Menu

	attr_reader :menu, :order


	def initialize(list_of_dishes, order_numbers = nil)
		@menu = list_of_dishes
		@order = order_numbers
	end


	def print
		orders?? print_order : print_full_menu
	end


	def sum
		orders?? print_order.inject(0) {|sum, hash| sum + hash[:price]} : "you've placed no orders yet"
	end


	private
	def print_full_menu
		@menu
	end

	def print_order
		@menu.values_at(*order)
	end

	def orders?
		!!order
	end

end