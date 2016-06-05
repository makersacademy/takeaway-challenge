require_relative 'menu'

class Order

	def initialize(menu = JapaneseMenu.new)
		@menu = menu
		@order = Hash.new(0)
	end

	def add(item, quantity)
		@order[item] += quantity
	end

	def view
		@order.map do |item, quantity|
			p "#{item} x #{quantity}"
		end	
	end

	def total
		@order_total = 0
		@order.each {|item, quantity| @order_total += (@menu.price(item) * quantity)}
		@order_total
	end

end