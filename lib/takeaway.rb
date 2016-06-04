require_relative 'menu'
require_relative 'order'

class Takeaway

	def initialize(menu = JapaneseMenu.new, order = Order.new(menu))
		@menu = menu
		@order = order
	end

	def view_menu
		@menu.view
	end

	def add_to_order(item, quantity = 1)
		@order.add(item, quantity)
	end

	def view_order
		@order.view
	end

	def checkout
		p "Your total is £#{@order.total}. Please type 'order.confirm' to confirm your order."
	end


end