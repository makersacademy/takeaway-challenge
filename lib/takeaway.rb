
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
		dishes.each do |dish, number|
			order.add(dish, number)
		end
		order.order_total
	end

	def confirm_order
		"Thank you! Your order was placed and will be delivered before 18:52"
	end

	private

	attr_reader :menu, :order

end