class Customer 

	def initialize order_handler
		@order_handler = order_handler
	end

	def get_menu
		order_handler.show_menu
	end

	private

	attr_reader :order_handler

end