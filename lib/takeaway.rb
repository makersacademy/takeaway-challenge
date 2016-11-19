require_relative 'menu'
require_relative 'order'

class Takeaway

	attr_reader :order_klass

	include Menu

	def initialize(order_klass)
		@order_klass = order_klass
	end

	def place_order
		new_order
	end

	private

		def new_order
			@order = order_klass.new
		end

end