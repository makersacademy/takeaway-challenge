require_relative 'menu'
require_relative 'order'

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
		@order.items
		total
	end

	def total
		@order.price
	end

end