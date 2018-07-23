require 'menu'
require 'order'
require 'sms'

class Takeaway

	attr_reader :order

	def initialize(menu = Menu.new, order = Order.new, sms = SMS.new)
		@menu = menu
		@order = order
		@sms = sms
	end

	def view_menu
		@menu.print_menu
	end

	def add_to_order(item, quantity = 1)
		raise "Sorry, we don't sell that!" if !available?(item)
		@order.add(@menu.items.select { |k,v| k == item }, quantity)
		@order.add_to_total(@menu.items[item], quantity)
		"Your current order total is £#{'%.2f' % @order.total}"
	end

	def check_order
		@order.view_order
	end

	def place_order
		@sms.send_sms
		"Your total comes to £#{'%.2f' % @order.total}. You should receive an order confirmation SMS shortly"
	end

	private

	def available?(item)
		@menu.items.has_key?(item)
	end

	def empty_order?(order)
		@order.basket.empty?
	end
end
