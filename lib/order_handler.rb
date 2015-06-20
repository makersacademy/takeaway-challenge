require_relative 'customer'
require_relative 'order_processor'

class OrderHandler


	def initialize menu, order_processor
		@menu 					 = menu
		@order_processor = order_processor
	end

	def show_menu
		menu
	end

	def process_order order 
		order_processor.process order 
	end 

	private

	attr_reader :menu, :order_processor

end

