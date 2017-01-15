require_relative 'menu'
require_relative 'order'

class Takeaway

	attr_reader :order

	def initialize(menu = Menu.new, order = Order.new)
		@menu = menu
		@order = order
	end

	def view_menu
		@menu.print_menu
	end

	def add_to_order(item, quantity = 1)
		raise "Cannot add to order: that item is not on the menu." if !available?(item)
		@order.add(@menu.items.select { |k,v| k == item }, quantity)
		@order.add_to_total(@menu.items[item], quantity)
		"Your current order total is £#{@order.total}"
	end

	def check_order
		#@order.current_order.join(",\n") + "Your current order total is £#{@order.total}"
		@order.print_order
	end

	private

	def available?(item)
		@menu.items.has_key?(item)
	end

end