require_relative 'menu'

class Takeaway

	attr_reader :order_klass

	include Menu

	def initialize(order_klass)
		@order_klass = order_klass
	end

	def new_order
		@order = order_klass.new
	end

end