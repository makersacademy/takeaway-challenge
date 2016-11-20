require_relative 'menu'
require_relative 'order'
require_relative 'checkout'

class Takeaway

	attr_reader :order_klass, :checkout

	include Menu

	def initialize(checkout_klass, order_klass)
		@checkout = checkout_klass.new
		@order_klass = order_klass
	end

	def place_order(number, quantity)
		new_order if @order == nil
		@order.add(number, quantity)
	end

	def check_order
		@order.basket << "Total: £#{@order.order_total}"
	end

	def pay
		total = @order.order_total
		@checkout.process_payment(total)
	end

	private

		def new_order
			@order = order_klass.new
		end

end