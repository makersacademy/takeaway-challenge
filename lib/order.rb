require_relative 'menu'

class Order

	def initialize(menu = Menu.new)
		@order = Hash.new(0)
		@total = 0
		@menu = menu
	end

	def add(item, qty = 0)
		@order[item] += qty
	end

	def include?(item)
		@order.include?(item)
	end

	def order_total
		@order.each {|item, qty| @total += (@menu.item_price(item) * qty) }
		@total
	end

end