require_relative "order_handler"

class Customer 

	def initialize order_handler
		@order_handler = order_handler
	end

	def get_menu
		order_handler.show_menu
	end

	def send_order order
		order_handler.process_order order 
	end

	private

	attr_reader :order_handler

end