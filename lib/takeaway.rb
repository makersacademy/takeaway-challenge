require_relative 'menu'
require_relative 'order'
require_relative 'sms'

class Takeaway

	attr_reader :order

	def initialize(menu = Menu.new, order = Order.new, sms = Sms.new)
		@menu = menu
		@order = order
		@sms = sms
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
		@order.print_order
	end

	def place_order
		@sms.send_sms
		"Thanks for your order!  You will be charged £#{@order.total}.  You will receive a confirmation SMS shortly."
	end

	private

	def available?(item)
		@menu.items.has_key?(item)
	end

	def empty_order?(order)
		@order.current_order.empty?
	end

end