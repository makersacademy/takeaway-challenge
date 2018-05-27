require_relative 'menu'

class Order

	attr_reader :order, :full_menu

	def initialize(list_of_selected_dishes, full_menu)
		@order = list_of_selected_dishes
		@full_menu = full_menu
	end

	def print_order
		@full_menu & @order
	end

end