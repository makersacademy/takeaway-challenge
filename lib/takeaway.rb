
require_relative 'order'

class Takeaway

	def initialize(menu:, order:) #menu: so print works on private menu
		@menu = menu
		@order = order || Order.new
	end

	def print_menu
		menu.show
	end

	def select_order(dishes)
		dishes.each do |dish, quantity|
			order.add(dish, quantity)
		end
	end

	private

	attr_reader :menu, :order

end