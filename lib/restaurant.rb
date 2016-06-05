# it interacts with the customer

require_relative 'menu'

class Restaurant

	def initialize(menu = Menu.new, order = nil)
		@menu = menu
		@order = order
	end

	def show_menu
		@menu.show_menu
	end

	def order_item(item, qty = 1)
		fail "This item is not on the menu" unless menu_include?(item)
		open_order if @order == nil
		@order.add_to_order(item, qty)
	end

	private

	def open_order
		@order = Order.new(@menu.show_menu)
	end

	def print(item,qty)
		"You have ordered #{qty} #{item} at a price of £#{@menu.show_menu[item] * qty}"
	end

	def menu_include?(item)
		@menu.show_menu.include?(item)
	end

end