require_relative 'menu'
require_relative 'order'
require_relative 'sms'

class Takeaway

	attr_reader :order_klass, :sms_klass

	include Menu

	def initialize(sms_klass, order_klass)
		@sms_klass = sms_klass
		@order_klass = order_klass
	end

	def place_order(number, quantity)
		new_order if @order == nil
		@order.add(number, quantity)
		@order.basket
	end

	def check_total
		"Total: £#{@order.order_total}"
	end

	def pay(total)
		raise "Order has not been created." if @order == nil
		raise "Payment amount is incorrect." if total != @order.order_total
		new_sms
		@order = nil
	end

	private

		def new_order
			@order = order_klass.new
		end

		def new_sms
			@sms = sms_class.new
		end

end