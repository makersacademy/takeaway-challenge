require_relative 'menu'
require_relative 'order'

class Takeaway

	def initialize(menu = Menu.new, order = Order.new)
		@menu = menu
		@order = order
	end

	def read_menu
		@menu.display_menu
	end

	def add_item(item, qty = 0)
		@order.add(item, qty)
	end

	def include?(item)
		@order.include?(item)
	end

end