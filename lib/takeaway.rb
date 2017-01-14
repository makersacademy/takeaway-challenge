require_relative 'menu'
require_relative 'order'
require_relative 'send_sms'

class Takeaway

	def initialize(menu=Menu.new, order=Order.new)
		@menu = menu
		@order = order
	end

	def list
		@menu.list
	end

	def order(item, quantity=1)
		quantity.times{@order.items << list.select { |k,v| k == item }}
		total
	end

	def check_total
		raise 'Incorrect total' if total != @order.price
		total
	end 

	def complete_order
		SMS.new.send_sms
	end

	def total
		@order.price
	end
end